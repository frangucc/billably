class RefinePurchaseModel < ActiveRecord::Migration
  def up
    add_column :purchases, :schedule_yaml, :text
    add_column :purchases, :chargify_id,    :integer
    drop_table :i_calendars
  end

  def down
    remove_column :purchases, :schedule_yaml
    create_table :i_calendars do |t|
      t.text     "schedule_yaml", :null => false
    end
  end
end
