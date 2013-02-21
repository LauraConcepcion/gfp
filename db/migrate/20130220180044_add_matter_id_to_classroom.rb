class AddMatterIdToClassroom < ActiveRecord::Migration
  def change
    add_column :classrooms, :matter_id, :integer
  end
end
