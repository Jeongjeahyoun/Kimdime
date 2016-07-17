class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.string :region
      t.string :day
      t.integer :temperture
      t.integer :raining
      t.string :image_url, default:""
      
      t.timestamps null: false
    end
  end
end
