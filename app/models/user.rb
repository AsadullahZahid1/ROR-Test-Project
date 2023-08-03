class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable


  # def self.ransackable_attributes(auth_object = nil)
  #   ["email", "password", "other_allowed_attributes"]
  # end


  def self.ransackable_attributes(auth_object =nil)
    super + ['posts_id','comments_id']
  end

  def self.ransackable_associations(auth_object = nil)
    ["posts"]
  end
end
