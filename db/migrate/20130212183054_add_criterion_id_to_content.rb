class AddCriterionIdToContent < ActiveRecord::Migration
  def change
    add_column :contents, :criterion_id, :integer
  end
end
