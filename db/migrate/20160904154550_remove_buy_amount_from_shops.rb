class RemoveBuyAmountFromShops < ActiveRecord::Migration
  def up
    remove_column :shops, :buy_amount
  end

  def down
    add_column :shops, :buy_amount, :integer
  end
end
