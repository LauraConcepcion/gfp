class DropQualifyingentityStudents < ActiveRecord::Migration
  def up
    drop_table :qualifyingentity_students
  end

  def down
  end
end
