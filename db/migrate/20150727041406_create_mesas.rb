class CreateMesas < ActiveRecord::Migration
  def change
    create_table :mesas do |t|
      t.integer :number
      t.string :state
      t.references :restaurant, index: true

      t.timestamps null: false
    end
    add_foreign_key :mesas, :restaurants
  end
end
