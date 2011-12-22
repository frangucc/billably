class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.float     :radium,        :required => true
      t.text      :schedule_yaml, :required => true
      t.string    :zipcode
      t.timestamps
    end
  end
end
