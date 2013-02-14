class AddClassroomIdToSchedule < ActiveRecord::Migration
  def change
    add_column :schedules, :classroom_id, :integer
  end
end
