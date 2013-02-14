class AddQualifyingentityIdToQualifyingentityStudent < ActiveRecord::Migration
  def change
    add_column :qualifyingentity_students, :qualifyingentity_id, :integer
  end
end
