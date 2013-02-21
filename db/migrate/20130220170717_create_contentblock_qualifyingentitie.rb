class CreateContentblockQualifyingentitie < ActiveRecord::Migration
  def up
    create_table :contentblocks_qualifyingentities do |t|
      t.integer :contentblock_id
      t.integer :qualifyingentity_id
    end
  end

  def down
  end
end
