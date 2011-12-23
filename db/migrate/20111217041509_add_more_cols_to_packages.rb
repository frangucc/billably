class AddMoreColsToPackages < ActiveRecord::Migration
  def change
    add_column :packages, :category_id,     :integer, :null => false
    add_column :packages, :delivery_date,   :date, :null => false
    add_column :packages, :frequency,       :integer, :null => false
    add_column :packages, :price,           :integer, :null => false
    add_column :packages, :name,            :string, :null => false
    add_column :packages, :subscription_id, :integer
  end
end
