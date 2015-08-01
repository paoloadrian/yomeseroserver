class AddItemTypeToOrdenItems < ActiveRecord::Migration
  def change
    add_column :orden_items, :item_type, :string
  end
end
