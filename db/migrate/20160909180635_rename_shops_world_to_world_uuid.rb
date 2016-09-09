class RenameShopsWorldToWorldUuid < ActiveRecord::Migration
  def up
    rename_column :shops, :world, :world_uuid
  end

  def down
    rename_column :shops, :world_uuid, :world
  end
end
