class Post < ActiveRecord::Base
  belongs_to :user
  has_many :feeds

  validates :description, presence: true
end
