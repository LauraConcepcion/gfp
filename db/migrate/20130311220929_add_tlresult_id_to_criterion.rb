class AddTlresultIdToCriterion < ActiveRecord::Migration
  def change
    add_column :criterions, :tlresult_id, :integer
  end
end
