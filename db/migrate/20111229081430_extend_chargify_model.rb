class ExtendChargifyModel < ActiveRecord::Migration
  def up
    add_column :chargifies, :name, :string
    add_column :chargifies, :code, :string
    add_column :chargifies, :description, :text
  end

  def down
    remove_column :chargifies, :name
    remove_column :chargifies, :code
    remove_column :chargifies, :description
  end
end
