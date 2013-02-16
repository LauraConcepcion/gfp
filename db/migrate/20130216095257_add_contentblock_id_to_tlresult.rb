class AddContentblockIdToTlresult < ActiveRecord::Migration
  def change
    add_column :tlresults, :contentblock_id, :integer
  end
end
