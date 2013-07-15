class ChangeTrainercicleTrainercycleObjetives < ActiveRecord::Migration
  def change
    rename_column :objetives, :trainercicle_id, :trainercycle_id
  end
end
