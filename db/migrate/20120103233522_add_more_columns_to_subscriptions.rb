class AddMoreColumnsToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :long_description, :text
    add_column :subscriptions, :fine_print, :text
    add_column :subscriptions, :shipping_radius_in_miles, :integer
    add_column :subscriptions, :ships_nationally, :boolean
    add_column :subscriptions, :offering, :string
    add_column :subscriptions, :shipping_info, :string
    add_column :subscriptions, :refundable, :boolean
    add_column :subscriptions, :etc, :string
  end
end
