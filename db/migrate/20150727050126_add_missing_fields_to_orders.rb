class AddMissingFieldsToOrders < ActiveRecord::Migration
  def change
  	add_reference :orders, :table, index: true
  	add_foreign_key :orders, :tables
  	add_column :orders, :state, :string
  end
end
