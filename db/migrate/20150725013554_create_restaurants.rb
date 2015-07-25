class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :restaurant_name
      t.text :restaurant_description
      t.string :restaurant_type
      t.string :restaurant_address
      t.string :restaurant_phone

      t.timestamps null: false
    end
  end
end
