class AddCityToShops < ActiveRecord::Migration
  def change
    add_column :shops, :city, :string
  end
end
