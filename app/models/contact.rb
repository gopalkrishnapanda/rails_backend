class Contact < ApplicationRecord
    belongs_to :user

    has_one_attached :photo
    has_many :groups, through: :group_contacts

    validates :name, presence: true
    validates :phno, presence: true, format: { with: /\A\d{10}\z/, message: "must be a 10-digit number" }
end
