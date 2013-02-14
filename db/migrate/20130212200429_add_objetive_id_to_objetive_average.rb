class AddObjetiveIdToObjetiveAverage < ActiveRecord::Migration
  def change
    add_column :objetive_averages, :objetive_id, :integer
  end
end
