class AddFieldsAndIndices < ActiveRecord::Migration
  def change
    add_column :subscriptions, :ships_internationally, :boolean, :default => false
  end
end
