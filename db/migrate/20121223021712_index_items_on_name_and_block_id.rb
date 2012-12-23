class IndexItemsOnNameAndBlockId < ActiveRecord::Migration
  def up
    add_index :items, :name
    add_index :items, :block_id
  end

  def down
    remove_index :items, :name
    remove_index :items, :block_id
  end
end
