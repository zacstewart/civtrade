class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :item
      t.integer :buy_price
      t.string :buy_currency
      t.integer :sell_price
      t.string :sell_currency
      t.float :location_x
      t.float :location_y
      t.float :location_z

      t.timestamps
    end
  end
end
