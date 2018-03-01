class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :univ
      t.string :email
      t.string :phone
      t.string :image_url, :default => ""

      t.timestamps null: false
    end
  end
end
