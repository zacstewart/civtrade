class AddReportsCountToShops < ActiveRecord::Migration
  def change
    add_column :shops, :reports_count, :integer, default: 0
  end
end
