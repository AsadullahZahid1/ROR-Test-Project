class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  def self.ransackable_attributes(auth_object = nil)
    super + ['user_id','comments_id']
  end


  def self.ransackable_associations(auth_object = nil)
    ["user"] # Add associations here if you want them to be searchable
  end


  def self.recent(n)
    order(created_at: :desc).limit(n)
  end
end
