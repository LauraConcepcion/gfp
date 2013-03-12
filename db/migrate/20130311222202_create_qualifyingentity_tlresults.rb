class CreateQualifyingentityTlresults < ActiveRecord::Migration
  def change
    create_table :qualifyingentity_tlresults do |t|
      t.integer :qualifyingentity_id
      t.integer :tlresult_id
      t.integer :percentage
      t.timestamps
    end
  end
end
