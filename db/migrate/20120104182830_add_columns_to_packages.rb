class AddColumnsToPackages < ActiveRecord::Migration
  def change
    add_column :packages, :our_cost, :float
    add_column :packages, :customer_cost, :float
    add_column :packages, :description, :text
    remove_column :packages, :price
    remove_column :packages, :frequency
  end
end
