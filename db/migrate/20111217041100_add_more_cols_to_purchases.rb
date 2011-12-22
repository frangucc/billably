class AddMoreColsToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :purchase_date,  :date, :null => false
    add_column :purchases, :package_id,     :integer, :null => false
    add_column :purchases, :price,          :integer, :null => false
    add_column :purchases, :user_id,        :integer, :null => false
  end
end
