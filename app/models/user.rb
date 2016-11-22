class User < ActiveRecord::Base
  has_many :followers
  has_many :posts
  has_many :feeds

  validates :user_name, :geo_location, presence: true

  def user_feeds page, limit
    self.feeds.order("created_at DESC")
  end
end
