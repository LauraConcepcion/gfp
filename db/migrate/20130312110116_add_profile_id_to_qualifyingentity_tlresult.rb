class AddProfileIdToQualifyingentityTlresult < ActiveRecord::Migration
  def change
    add_column :qualifyingentity_tlresults, :profile_id, :integer
  end
end
