class ChangeBlocks < ActiveRecord::Migration
  def up
    add_column :contentblocks, :cb_id, :string
    add_column :contents, :c_id, :string
  end

  def down
    remove_column :contentblocks, :cb_id
    remove_column :contents, :c_id
  end
end
