class AddStudentIdToQualifyingentityStudent < ActiveRecord::Migration
  def change
    add_column :qualifyingentity_students, :student_id, :integer
  end
end
