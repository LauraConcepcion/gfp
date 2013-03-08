class AddProfileIdToQualifyingentityCriterions < ActiveRecord::Migration
  def change
    add_column :qualifyingentity_criterions, :profile_id, :integer
  end
end
