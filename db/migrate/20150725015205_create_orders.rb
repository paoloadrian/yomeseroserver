class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :total
      t.references :restaurant, index: true

      t.timestamps null: false
    end
    add_foreign_key :orders, :restaurants
    add_foreign_key :orders, :users
  end
end
