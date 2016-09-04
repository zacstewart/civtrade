class RenameShopsBuyFieldsToInputFields < ActiveRecord::Migration
  def up
    rename_column :shops, :buy_currency, :input_item_name
    rename_column :shops, :buy_price, :input_amount
    add_column :shops, :input_item_id, :integer
  end

  def down
    rename_column :shops, :input_item_name, :buy_currency
    rename_column :shops, :input_amount, :buy_price
    remove_column :shops, :input_item_id
  end
end
