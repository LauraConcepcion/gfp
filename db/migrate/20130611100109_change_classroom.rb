class ChangeClassroom < ActiveRecord::Migration
  def up
    remove_column :classrooms, :trainercycle_id
    remove_column :classrooms, :teacher_id
    remove_column :classrooms, :matter_id
    remove_column :classrooms, :group_id
    remove_column :classrooms, :student_id
    add_column :students, :classroom_id, :integer
    
  end

  def down
  end
end
