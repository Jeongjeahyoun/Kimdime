class CreateCurrentWeathers < ActiveRecord::Migration
  def change
    create_table :current_weathers do |t|
      
      t.string :day
      t.integer :temperture
      t.integer :rainy
      t.timestamps null: false
    end
  end
end
