class ChangeItemToOutputItem < ActiveRecord::Migration
  def up
    rename_column :shops, :item_name, :output_item_name
    rename_column :shops, :item_id, :output_item_id
  end

  def down
    rename_column :shops, :output_item_name, :item_name
    rename_column :shops, :output_item_id, :item_id
  end
end
