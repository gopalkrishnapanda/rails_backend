class GroupContact < ApplicationRecord
    belongs_to :group
    belongs_to :contact

    validates :contact_id, uniqueness: { scope: :group_id }
end