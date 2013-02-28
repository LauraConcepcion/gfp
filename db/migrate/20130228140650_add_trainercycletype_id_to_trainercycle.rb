class AddTrainercycletypeIdToTrainercycle < ActiveRecord::Migration
  def change
    add_column :trainercycles, :trainercycletype_id, :integer
  end
end
