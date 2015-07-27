class CreateOrdens < ActiveRecord::Migration
  def change
    create_table :ordens do |t|
      t.integer :mesa
      t.float :consumo
      t.integer :rest
      t.string :estado

      t.timestamps null: false
    end
  end
end
