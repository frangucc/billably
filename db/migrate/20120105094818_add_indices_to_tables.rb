class AddIndicesToTables < ActiveRecord::Migration
  def up 
    add_index :images, :imageable_type
    add_index :images, :imageable_id
    add_index :purchases, :chargify_id
    add_index :schedules, :package_id
    remove_column :purchases, :billing_id
    remove_column :purchases, :serving_id
  end

  def down 
    remove_index :images, :imageable_type
    remove_index :images, :imageable_id
    remove_index :purchases, :chargify_id
    remove_index :schedules, :package_id
    add_column :purchases, :billing_id, :integer
    add_column :purchases, :serving_id, :integer
  end
end
