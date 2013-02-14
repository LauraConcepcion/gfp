class AddCriterionIdToQualifyingentityCriterion < ActiveRecord::Migration
  def change
    add_column :qualifyingentity_criterions, :criterion_id, :integer
  end
end
