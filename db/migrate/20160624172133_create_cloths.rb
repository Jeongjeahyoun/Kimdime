class CreateCloths < ActiveRecord::Migration
  def change
    create_table :cloths do |t|
      t.string :category
      t.string :name
      t.integer :min
      t.integer :max
      t.string :goStop
      
      t.timestamps null: false
    end
  end
end
