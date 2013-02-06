class AddInstituteIdToTrainercycle < ActiveRecord::Migration
  def change
    add_column :trainercycles, :institute_id, :integer
  end
end
