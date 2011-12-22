class AddBelongsToSchedule < ActiveRecord::Migration
  def change
    add_column :schedules, :package_id, :integer, :required => true
  end
end
