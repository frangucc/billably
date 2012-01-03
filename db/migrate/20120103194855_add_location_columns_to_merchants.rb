class AddLocationColumnsToMerchants < ActiveRecord::Migration
  def change
    add_column :merchants, :city, :string
    add_column :merchants, :state, :string
  end
end
