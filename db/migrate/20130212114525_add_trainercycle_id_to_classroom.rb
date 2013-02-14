class AddTrainercycleIdToClassroom < ActiveRecord::Migration
  def change
    add_column :classrooms, :trainercycle_id, :integer
  end
end
