class RemoveSellerAndCityFromShops < ActiveRecord::Migration
  def up
    remove_column :shops, :seller_username
    remove_column :shops, :city
  end

  def down
    add_column :shops, :seller_username, :string
    add_column :shops, :city, :string
  end
end
