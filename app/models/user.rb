class User < ActiveRecord::Base
  has_many :tweets
  has_many :followers through =>
  has_many :followees, class_name: "Follow",
                        foreign_key: ""

end
