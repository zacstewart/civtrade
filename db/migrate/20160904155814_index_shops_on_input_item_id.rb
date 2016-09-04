class IndexShopsOnInputItemId < ActiveRecord::Migration
  def up
    add_index :shops, :input_item_id
  end

  def down
    remove_index :shops, :input_item_id
  end
end
