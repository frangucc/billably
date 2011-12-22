class AddIndices < ActiveRecord::Migration
  def change
    add_index :categories,    :featured
    add_index :categories,    :order
    add_index :packages,      :category_id
    add_index :packages,      :subscription_id
    add_index :purchases,     :package_id
    add_index :purchases,     :user_id
    add_index :subscriptions, :featured
    add_index :subscriptions, :order
    add_index :subscriptions, :merchant_id
  end
end
