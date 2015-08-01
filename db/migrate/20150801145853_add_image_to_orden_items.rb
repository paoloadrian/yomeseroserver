class AddImageToOrdenItems < ActiveRecord::Migration
  def change
    add_column :orden_items, :item_image, :string
  end
end
