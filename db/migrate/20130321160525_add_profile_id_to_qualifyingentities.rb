class AddProfileIdToQualifyingentities < ActiveRecord::Migration
  def change
    add_column :qualifyingentities, :profile_id, :integer
  end
end
