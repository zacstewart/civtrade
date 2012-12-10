class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :shop

      t.timestamps
    end
  end
end
