class AddClassroomIdToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :classroom_id, :integer
  end
end
