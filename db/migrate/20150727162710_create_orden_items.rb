class CreateOrdenItems < ActiveRecord::Migration
  def change
    create_table :orden_items do |t|
      t.integer :cantidad
      t.integer :id_item
      t.integer :id_orden

      t.timestamps null: false
    end
  end
end
