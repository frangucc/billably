class ExtendPurchaseEventSchedule < ActiveRecord::Migration
  def up
    add_column :purchases, :billing_id, :integer
    add_column :purchases, :serving_id, :integer
  end

  def down
    remove_column :purchases, :billing_id, :integer
    remove_column :purchases, :serving_id, :integer
  end
end
