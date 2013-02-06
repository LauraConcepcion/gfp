class CreateCriterionQualifyingentities < ActiveRecord::Migration
  def change
    create_table :criterion_qualifyingentities do |t|
      t.string :percentage

      t.timestamps
    end
  end
end
