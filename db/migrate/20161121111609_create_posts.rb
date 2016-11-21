class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id, index: true
      t.text :description

      t.timestamps null: false
    end
  end
end
