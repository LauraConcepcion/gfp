class RemoveColumnAverageToObjetiveAverages < ActiveRecord::Migration
  def up
    remove_column :objetive_averages, :average
  end

  def down
    add_column :objetive_averages, :average, :integer
  end
end
