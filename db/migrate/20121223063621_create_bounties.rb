class CreateBounties < ActiveRecord::Migration
  def change
    create_table :bounties do |t|
      t.string :username

      t.timestamps
    end

    add_index :bounties, :username
  end
end
