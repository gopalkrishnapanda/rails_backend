class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[show update destroy remove_contact]

  def index
    render json: current_user.groups.includes(:contacts).map { |group| group_json(group) }
  end

  def show
    render json: group_json(@group)
  end

  def create
    @group = current_user.groups.new(group_params)

    if save_group
      render json: group_json(@group), status: :created
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  def update
    if save_group
      render json: group_json(@group)
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @group.destroy!
    head :no_content
  end

  def remove_contact
    contact = @group.contacts.find(params[:contact_id])
    @group.group_contacts.find_by!(contact: contact).destroy!
    head :no_content
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Contact is not in this group" }, status: :not_found
  end

  private

  def set_group
    @group = current_user.groups.find(params[:id] || params[:group_id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Group not found" }, status: :not_found
  end

  def group_params
    params.require(:group).permit(:name, contact_ids: [])
  end

  def save_group
    contact_ids = group_params[:contact_ids]
    attributes = group_params.except(:contact_ids)

    ActiveRecord::Base.transaction do
      @group.assign_attributes(attributes)
      @group.save!
      @group.contacts = current_user.contacts.where(id: contact_ids) if contact_ids
    end

    true
  rescue ActiveRecord::RecordInvalid
    false
  end

  def group_json(group)
    group.as_json(include: :contacts)
  end
end