class AddAacceIdToContentblock < ActiveRecord::Migration
  def change
    add_column :contentblocks, :aacce_id, :integer
  end
end
