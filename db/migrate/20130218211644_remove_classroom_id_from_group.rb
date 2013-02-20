class RemoveClassroomIdFromGroup < ActiveRecord::Migration
  def up
    remove_column :groups, :classroom_id
  end

  def down
    add_column :groups, :classroom_id, :integer
  end
end
