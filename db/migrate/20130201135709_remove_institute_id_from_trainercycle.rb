class RemoveInstituteIdFromTrainercycle < ActiveRecord::Migration
  def up
    remove_column :trainercycles, :institute_id
  end

  def down
    add_column :trainercycles, :institute_id, :char
  end
end
