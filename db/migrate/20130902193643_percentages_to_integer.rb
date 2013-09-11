class PercentagesToInteger < ActiveRecord::Migration
  def up
    change_column :tlresult_percentages, :quarter_1, :integer
    change_column :tlresult_percentages, :quarter_2, :integer
    change_column :tlresult_percentages, :quarter_3, :integer
    change_column :tlresult_percentages, :global, :integer
  end

  def down
    change_column :tlresult_percentages, :global, :float
    change_column :tlresult_percentages, :quarter_3, :float
    change_column :tlresult_percentages, :quarter_2, :float
    change_column :tlresult_percentages, :quarter_1, :float
  end
end
