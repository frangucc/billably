class AddMoreColsToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :area,         :string, :null => false
    add_column :subscriptions, :featured,     :boolean
    add_column :subscriptions, :merchant_id,  :integer, :null => false
    add_column :subscriptions, :name,         :string, :null => false
    add_column :subscriptions, :order,        :integer, :default => 0
    add_column :subscriptions, :zipcode,      :string, :null => false
  end
end
