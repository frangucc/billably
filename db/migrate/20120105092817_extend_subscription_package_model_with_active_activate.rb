class ExtendSubscriptionPackageModelWithActiveActivate < ActiveRecord::Migration
  def up
    add_column :subscriptions, :active, :boolean, :default => true
    add_column :subscriptions, :activate,   :datetime
    add_column :subscriptions, :deactivate, :datetime
    
    add_column :packages, :active, :boolean, :default => true
    add_column :packages, :activate,   :datetime
    add_column :packages, :deactivate, :datetime
  end

  def down
    remove_column :subscriptions, :active
    remove_column :subscriptions, :activate
    remove_column :subscriptions, :deactivate
    
    remove_column :packages, :active
    remove_column :packages, :activate
    remove_column :packages, :deactivate
  end
end
