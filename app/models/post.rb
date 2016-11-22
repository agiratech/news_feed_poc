class Post < ActiveRecord::Base
  belongs_to :user
  has_many :feeds

  validates :description, presence: true

  # To create feeds
  after_create :add_to_news_feed


  # long running method
  def add_to_news_feed
    followers = Follower.where("friend_id = ?", self.user_id).map(&:user_id)
    feed_items = []
    feed_items << Feed.new(user_id: self.user_id, posted_by: self.user_id, post_id: self.id)
    followers.each do |follower|
      feed_items << Feed.new(user_id: follower, posted_by: self.user_id, post_id: self.id)
    end
    Feed.import feed_items
  end
  handle_asynchronously :add_to_news_feed

end
