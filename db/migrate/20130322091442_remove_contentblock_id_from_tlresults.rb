class RemoveContentblockIdFromTlresults < ActiveRecord::Migration
  def up
    remove_column :tlresults, :contentblock_id
  end

  def down
    add_column :tlresults, :contentblock_id, :integer
  end
end
