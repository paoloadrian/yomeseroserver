class CreateMesas < ActiveRecord::Migration
  def change
    create_table :mesas do |t|
      t.integer :numero
      t.string :estado
      t.references :restaurant, index: true

      t.timestamps null: false
    end
    add_foreign_key :mesas, :restaurants
  end
end
