class AddColumnsToPackages < ActiveRecord::Migration
  def change
    add_column :packages, :our_cost,      :integer, :required => false
    add_column :packages, :customer_cost, :integer, :required => true
    add_column :packages, :description,   :text

    remove_column :packages, :price
  end
end
