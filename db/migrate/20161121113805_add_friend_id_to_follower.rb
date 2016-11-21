class AddFriendIdToFollower < ActiveRecord::Migration
  def change
    add_column :followers, :friend_id, :integer, index: true
  end
end
