class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.float :consumo
      t.string :estado
      t.integer :restaurant_id
      t.integer :mesa
      
      t.timestamps null: false
    end
  end
end
