class AddContentblockIdToMatter < ActiveRecord::Migration
  def change
    add_column :matters, :contentblock_id, :integer
  end
end
