class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string "email"
      t.string :title
      t.text :content
      t.string "emailtitle"
      t.text  "emailcontent"

      t.timestamps null: false
    end
  end
end
