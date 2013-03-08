class RemoveBlockIdFromMatter < ActiveRecord::Migration
  def up
    remove_column :matters, :contentblock_id
  end

  def down
    add_column :matters, :contentblock_id, :integer
  end
end
