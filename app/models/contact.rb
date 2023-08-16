class Contact < ApplicationRecord
  validates :subject, presence: true
  belongs_to :user

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "message", "read", "subject", "updated_at", "user_id"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["user", "admin_user"]
  end

end
