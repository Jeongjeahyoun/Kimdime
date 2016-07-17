class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :rainy
      t.string :veryHot
      t.string :sunny
      t.string :sun
      t.string :bottleTaste
    
      t.timestamps null: false
    end
  end
end
