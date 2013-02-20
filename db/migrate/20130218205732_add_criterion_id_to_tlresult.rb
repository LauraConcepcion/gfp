class AddCriterionIdToTlresult < ActiveRecord::Migration
  def change
    add_column :tlresults, :criterion_id, :integer
  end
end
