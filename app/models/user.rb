class User < ActiveRecord::Base
  validates :handle, uniqueness: true

  has_many :tweets

  has_many :follower_relationships, class_name: "Relationship", foreign_key: "followed_id"
  has_many :followed_relationships, class_name: "Relationship", foreign_key: "follower_id"

  has_many :followers, through: :follower_relationships
  has_many :followeds, through: :followed_relationships

  def follow user
    Relationship.create follower_id: self.id, followed_id: user.id
  end
end
