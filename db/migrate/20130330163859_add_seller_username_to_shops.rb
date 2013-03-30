class AddSellerUsernameToShops < ActiveRecord::Migration
  def up
    add_column :shops, :seller_username, :string
    add_index :shops, :seller_username
  end

  def down
    remove_index :shops, :seller_username
    remove_column :shops, :seller_username
  end
end
