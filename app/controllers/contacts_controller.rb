class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contact, only: %i[ show update destroy ]

  # GET /contacts
  def index
    @contacts = current_user.contacts.all
    render json: @contacts.map { |contact| contact_json(contact) }
  end

  # GET /contacts/1
  def show
    render json: contact_json(@contact)
  end

  # POST /contacts
  def create
    @contact = current_user.contacts.new(contact_params)

    if @contact.save
      render json: contact_json(@contact), status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: contact_json(@contact)
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = current_user.contacts.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Contact not found' }, status: :not_found
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:name, :phno, :photo, :is_favourite)
    end

    def contact_json(contact)
      contact.as_json.merge(
        "photo" => if contact.photo.attached?
                    {
                      "signed_id" => contact.photo.signed_id,
                      "filename" => contact.photo.filename.to_s
                    }
                  end
      )
    end
end
