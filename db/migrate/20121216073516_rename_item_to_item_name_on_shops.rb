class RenameItemToItemNameOnShops < ActiveRecord::Migration
  def up
    rename_column :shops, :item, :item_name
    say_with_time 'Reseting shop item names to link to items' do
      Shop.all.each do |shop|
        shop.update_attribute :item_name, shop.item_name
      end
    end
  end

  def down
    rename_column :shops, :item_name, :item
  end
end
