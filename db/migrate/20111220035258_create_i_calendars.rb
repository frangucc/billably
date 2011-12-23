class CreateICalendars < ActiveRecord::Migration
  def change
    create_table :i_calendars do |t|
      t.text :schedule_yaml, :null => false
      t.timestamps
    end
  end
end
