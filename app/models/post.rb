class Post < ApplicationRecord
  validates :title, :body, presence: true
  belongs_to :user
  has_many :comments , dependent: :destroy
  has_many :ratings

  def self.ransackable_attributes(auth_object = nil)
    super + ['user_id', 'comments_id']
  end

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end

  def self.recent(n)
    order(created_at: :desc).limit(n)
  end
end
