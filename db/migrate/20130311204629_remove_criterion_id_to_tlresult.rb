class RemoveCriterionIdToTlresult < ActiveRecord::Migration
  def up
    remove_column :tlresults, :criterion_id
  end

  def down
    add_column :tlresults, :criterion_id, :integer
  end
end
