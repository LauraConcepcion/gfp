class RemoveCodeToClassroom < ActiveRecord::Migration
  def up
    remove_column :classrooms, :code
  end

  def down
  end
end
