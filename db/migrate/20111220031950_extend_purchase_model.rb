class ExtendPurchaseModel < ActiveRecord::Migration
  def up
    add_column :purchases, :card_type, :string
    add_column :purchases, :card_number, :string
  end

  def down
    remove_column :purchases, :card_type
    remove_column :purchases, :card_number
  end
end
