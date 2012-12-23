class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.references :bounty
      t.references :user
      t.string :amount
      t.string :amount_currency
      t.integer :amount_value
      t.text :comment

      t.timestamps
    end
    add_index :pledges, :bounty_id
    add_index :pledges, :user_id
  end
end
