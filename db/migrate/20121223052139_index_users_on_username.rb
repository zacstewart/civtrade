class IndexUsersOnUsername < ActiveRecord::Migration
  def up
    add_index :users, :username
  end

  def down
    remove_index :users, :username
  end
end
