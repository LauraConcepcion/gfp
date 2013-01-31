class AddInstituteIdToTrainercycle < ActiveRecord::Migration
  def change
    add_column :trainercycles, :institute_id, :string
  end
end
