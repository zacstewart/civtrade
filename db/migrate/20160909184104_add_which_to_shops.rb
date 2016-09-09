class AddWhichToShops < ActiveRecord::Migration
  def change
    add_column :shops, :which, :integer, null: false, default: 1
  end
end
