class RenameColumnTrainercycleNumaioNumanio < ActiveRecord::Migration
  def up
    rename_column :trainercycles, :numaios, :numanio
  end

  def down
  end
end
