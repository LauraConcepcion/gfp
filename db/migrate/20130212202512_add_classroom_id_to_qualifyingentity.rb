class AddClassroomIdToQualifyingentity < ActiveRecord::Migration
  def change
    add_column :qualifyingentities, :classroom_id, :integer
  end
end
