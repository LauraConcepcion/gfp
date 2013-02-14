class AddContentblockIdToContent < ActiveRecord::Migration
  def change
    add_column :contents, :contentblock_id, :integer
  end
end
