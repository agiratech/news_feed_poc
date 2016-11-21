class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :geo_location
      t.string :profile_picture

      t.timestamps null: false
    end
  end
end
