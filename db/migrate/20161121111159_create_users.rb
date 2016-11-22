class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :geo_location
      t.timestamps null: false
      t.attachment :profile_picture
    end
  end
end
