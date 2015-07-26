class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_name
      t.text :item_description
      t.string :item_type
      t.integer :item_time
      t.float :item_price
      t.references :restaurant, index: true

      t.timestamps null: false
    end
    add_foreign_key :items, :restaurants
  end
end
