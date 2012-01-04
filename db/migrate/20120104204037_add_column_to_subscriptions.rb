class AddColumnToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :is_active, :boolean
  end
end
