class AddWorldToShops < ActiveRecord::Migration
  def change
    add_column :shops, :world, :string
  end
end
