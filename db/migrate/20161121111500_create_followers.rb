class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.integer :user_id, index: true

      t.timestamps null: false
    end
  end
end
