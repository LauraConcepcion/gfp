class AddClassroomIdToObjetiveAverages < ActiveRecord::Migration
  def change
    add_column :objetive_averages, :classroom_id, :integer
  end
end
