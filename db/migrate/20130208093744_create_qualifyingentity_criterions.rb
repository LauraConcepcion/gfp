class CreateQualifyingentityCriterions < ActiveRecord::Migration
  def change
    create_table :qualifyingentity_criterions do |t|
      t.integer :percentage

      t.timestamps
    end
  end
end
