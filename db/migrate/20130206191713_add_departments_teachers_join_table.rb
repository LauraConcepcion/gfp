class AddDepartmentsTeachersJoinTable < ActiveRecord::Migration
  def up
    create_table :departments_teachers, :id => false do |t|
      t.references :department, :teacher
    end
  end

  def down
    drop_table :departments_teachers
  end
end
