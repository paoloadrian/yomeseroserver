class AddRestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rest, :integer
  end
end
