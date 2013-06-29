class ScoresQualifyingentityTlresultId < ActiveRecord::Migration
  def change
    rename_column :scores, :qualifyingentity_id, :qualifyingentity_tlresult_id
  end
end
