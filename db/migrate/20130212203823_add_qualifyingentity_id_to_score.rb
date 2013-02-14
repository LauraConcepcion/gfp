class AddQualifyingentityIdToScore < ActiveRecord::Migration
  def change
    add_column :scores, :qualifyingentity_id, :integer
  end
end
