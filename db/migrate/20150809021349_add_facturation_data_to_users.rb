class AddFacturationDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nit, :integer
    add_column :users, :name, :string
  end
end
