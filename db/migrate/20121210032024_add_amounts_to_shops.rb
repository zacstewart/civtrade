class AddAmountsToShops < ActiveRecord::Migration
  def change
    add_column :shops, :buy_amount, :integer
    add_column :shops, :sell_amount, :integer
  end
end
