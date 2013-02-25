class AddTeacherIdToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :teacher_id, :integer
  end
end
