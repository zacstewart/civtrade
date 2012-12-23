class AddPledgesCountToBounties < ActiveRecord::Migration
  def change
    add_column :bounties, :pledges_count, :integer
  end
end
