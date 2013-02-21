class AddTrainercycleIdToMatter < ActiveRecord::Migration
  def change
    add_column :matters, :trainercycle_id, :integer
  end
end
