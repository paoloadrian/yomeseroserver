class AddMissingFieldsToOrders < ActiveRecord::Migration
  def change
  	add_reference :orders, :mesa, index: true
  	add_foreign_key :orders, :mesas
  	add_column :orders, :state, :string
  end
end
