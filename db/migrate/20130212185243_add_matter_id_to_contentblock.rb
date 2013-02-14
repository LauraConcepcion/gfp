class AddMatterIdToContentblock < ActiveRecord::Migration
  def change
    add_column :contentblocks, :matter_id, :integer
  end
end
