class AddOrdenToOrdenItems < ActiveRecord::Migration
  def change
    add_reference :orden_items, :orden, index: true
    add_foreign_key :orden_items, :ordens
  end
end
