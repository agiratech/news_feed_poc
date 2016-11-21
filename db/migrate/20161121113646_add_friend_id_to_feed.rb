class AddFriendIdToFeed < ActiveRecord::Migration
  def change
    add_column :feeds, :posted_by, :integer, index: true
  end
end
