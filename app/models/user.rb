class User < ActiveRecord::Base
  has_many :followers
  has_many :posts
  has_many :feeds
end
