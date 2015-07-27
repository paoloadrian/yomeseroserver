class CreatePedidoItems < ActiveRecord::Migration
  def change
    create_table :pedido_items do |t|
      t.integer :quantity
      t.references :pedido, index: true
      t.references :item, index: true

      t.timestamps null: false
    end
    add_foreign_key :pedido_items, :orders
    add_foreign_key :pedido_items, :items
  end
end
