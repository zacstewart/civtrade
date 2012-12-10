class AddWorldToShops < ActiveRecord::Migration
  def change
    add_column :shops, :world, :string
    Shop.update_all(world: 'overworld')
  end
end
