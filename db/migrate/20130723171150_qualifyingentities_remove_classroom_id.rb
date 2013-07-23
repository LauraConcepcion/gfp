class QualifyingentitiesRemoveClassroomId < ActiveRecord::Migration
  def change
    remove_column :qualifyingentities, :classroom_id
  end
end
