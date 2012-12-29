class RenameUsernameWantedUsernameOnBounties < ActiveRecord::Migration
  def up
    rename_column :bounties, :username, :wanted_username
  end

  def down
    rename_column :bounties, :wanted_username, :username
  end
end
