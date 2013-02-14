class AddQualifyingentityIdToQualifyingentityCriterion < ActiveRecord::Migration
  def change
    add_column :qualifyingentity_criterions, :qualifyingentity_id, :integer
  end
end
