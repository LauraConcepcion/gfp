class AddQuarterIdToContentblock < ActiveRecord::Migration
  def change
    add_column :contentblocks, :quarter_id, :integer
  end
end
