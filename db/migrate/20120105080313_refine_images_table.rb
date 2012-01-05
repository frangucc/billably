class RefineImagesTable < ActiveRecord::Migration
  def up
    remove_column :images, :merchant_id
    remove_column :images, :package_id
    add_column :images, :imageable_type, :string
    add_column :images, :imageable_id, :integer
  end

  def down
    add_column :images, :merchant_id, :integer
    add_column :images, :package_id, :integer
    remove_column :images, :imageable_type
    remove_column :images, :imageable_id
  end
end
