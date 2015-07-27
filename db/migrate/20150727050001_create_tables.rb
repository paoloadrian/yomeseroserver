class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :number
      t.string :state
      t.references :restaurant, index: true

      t.timestamps null: false
    end
    add_foreign_key :tables, :restaurants
  end
end
