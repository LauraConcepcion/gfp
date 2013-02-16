class RemoveScoreToClassroom < ActiveRecord::Migration
  def up
    remove_column :classrooms, :score
  end

  def down
    add_column :classrooms, :score, :integer
  end
end
