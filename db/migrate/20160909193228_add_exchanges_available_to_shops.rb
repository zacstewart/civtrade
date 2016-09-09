class AddExchangesAvailableToShops < ActiveRecord::Migration
  def change
    add_column :shops, :exchanges_available, :integer, null: false, default: 0
  end
end
