class AddItemIdToShops < ActiveRecord::Migration
  def change
    add_column :shops, :item_id, :integer
    add_index :shops, :item_id
  end
end
