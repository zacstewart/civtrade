class IndexReportsOnShopId < ActiveRecord::Migration
  def up
    add_index :reports, :shop_id
  end

  def down
    remove_index :reports, :shop_id
  end
end
