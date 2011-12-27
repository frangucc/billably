class CreateChargifies < ActiveRecord::Migration
  def change
    create_table :chargifies do |t|
      t.text :schedule_yaml
      t.timestamps
    end
  end
end
