class AddClassroomToProfile < ActiveRecord::Migration
  def up
    add_column :profiles, :classroom_id, :integer
  end
  def down
    remove_column :profiles, :classroom_id
  end
end
