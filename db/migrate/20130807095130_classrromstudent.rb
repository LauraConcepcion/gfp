class Classrromstudent < ActiveRecord::Migration
  def up
    create_table "classrooms_students", :id => false do |t|
      t.column "classroom_id", :integer, :null => false
      t.column "student_id",  :integer, :null => false
    end
    remove_column :students, :classroom_id
    remove_column :profiles, :classroom_id
    add_column :classrooms, :profile_id, :integer
  end

  def down
    drop_table "classrooms_students"
    add_column :profiles, :classroom_id, :integer
    remove_column :classrooms, :profile_id
    add_column :students, :classroom_id, :integer 
  end
end
