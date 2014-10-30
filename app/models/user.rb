class User < ActiveRecord::Base
  has_many :tweets
  has_many :followers
  has_many :followees, class_name: "Follow",
                        foreign_key: ""

  validates :handle, uniqueness: true
end
