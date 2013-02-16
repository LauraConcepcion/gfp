class AddTlresultIdToContentblock < ActiveRecord::Migration
  def change
    add_column :contentblocks, :tlresult_id, :integer
  end
end
