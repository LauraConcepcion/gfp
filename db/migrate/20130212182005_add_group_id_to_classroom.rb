class AddGroupIdToClassroom < ActiveRecord::Migration
  def change
    add_column :classrooms, :group_id, :integer
  end
end
