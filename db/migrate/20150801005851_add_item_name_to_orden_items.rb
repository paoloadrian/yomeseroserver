class AddItemNameToOrdenItems < ActiveRecord::Migration
  def change
    add_column :orden_items, :item_name, :string
  end
end
