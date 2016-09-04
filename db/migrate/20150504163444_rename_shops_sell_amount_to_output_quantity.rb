class RenameShopsSellAmountToOutputQuantity < ActiveRecord::Migration
  def up
    rename_column :shops, :sell_amount, :output_amount
  end

  def down
    rename_column :shops, :output_amount, :sell_amount
  end
end
