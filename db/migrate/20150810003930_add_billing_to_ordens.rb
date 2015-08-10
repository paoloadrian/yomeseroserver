class AddBillingToOrdens < ActiveRecord::Migration
  def change
    add_column :ordens, :nit, :integer
    add_column :ordens, :name, :string
  end
end
