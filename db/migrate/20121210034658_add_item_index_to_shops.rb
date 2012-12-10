class AddItemIndexToShops < ActiveRecord::Migration
  def up
    execute <<-SQL
    CREATE INDEX index_shops_on_lower_item
    ON shops(lower(item))
    SQL
  end

  def down
    remove_index :shops, name: 'index_shops_on_lower_item'
  end
end
