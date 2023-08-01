class Post < ApplicationRecord
  paginates_per 10
  belongs_to :user
  def self.ransackable_attributes(auth_object = nil)
    ["body", "created_at", "id", "title", "updated_at"]
  end
end
