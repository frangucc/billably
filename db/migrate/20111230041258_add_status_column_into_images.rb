class AddStatusColumnIntoImages < ActiveRecord::Migration
  def up
    add_column :images, :processing, :boolean, :default => false 
  end

  def down
    remove_column :images, :processing
  end
end
