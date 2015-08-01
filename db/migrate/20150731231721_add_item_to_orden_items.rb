class AddItemToOrdenItems < ActiveRecord::Migration
  def change
    add_reference :orden_items, :item, index: true
    add_foreign_key :orden_items, :items
  end
end
