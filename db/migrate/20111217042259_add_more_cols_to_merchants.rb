class AddMoreColsToMerchants < ActiveRecord::Migration
  def change
    add_column :merchants, :email,    :string, :null => false
    add_column :merchants, :featured, :boolean
    add_column :merchants, :name,     :string, :null => false
    add_column :merchants, :zipcode,  :string, :null => false
  end
end
