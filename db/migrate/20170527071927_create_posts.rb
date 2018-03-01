class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.string :user_id
      t.string :tname
      t.timestamps null: false
    end
  end
end
