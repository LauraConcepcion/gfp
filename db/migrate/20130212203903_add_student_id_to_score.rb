class AddStudentIdToScore < ActiveRecord::Migration
  def change
    add_column :scores, :student_id, :integer
  end
end
