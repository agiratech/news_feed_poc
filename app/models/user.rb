class User < ActiveRecord::Base
  has_many :followers
  has_many :posts
  has_many :feeds

  has_attached_file :profile_picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates :user_name, :geo_location, presence: true
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  def user_feeds page, limit
    feed_items = self.feeds.order("created_at DESC").includes(:post, :user).paginate(:page => page, :per_page => limit)
    results =[]
    feed_items.each do |feed_item|
      results << {
        post_id: feed_item.try(:post).try(:id),
        description: feed_item.try(:post).try(:description),
        created_at: feed_item.try(:post).try(:created_at),
        updated_at: feed_item.try(:post).try(:updated_at),
        user: {
          id: feed_item.try(:user).try(:id),
          user_name: feed_item.try(:user).try(:user_name),
          geo_location: feed_item.try(:user).try(:geo_location)
        }
      }
    end
    return results
  end
end
