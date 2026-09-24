class AddIsFavouriteToContacts < ActiveRecord::Migration[7.1]
  def change
    add_column :contacts, :is_favourite, :boolean, null: false, default: false
  end
end
