class RemoveShopsSellPriceAndCurrency < ActiveRecord::Migration
  def change
    remove_column :shops, :sell_price, :integer
    remove_column :shops, :sell_currency, :string
  end
end
