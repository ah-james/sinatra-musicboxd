class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :album
      t.string :artist
      t.float :score
      t.text :review
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
