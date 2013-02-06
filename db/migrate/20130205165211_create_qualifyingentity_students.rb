class CreateQualifyingentityStudents < ActiveRecord::Migration
  def change
    create_table :qualifyingentity_students do |t|
      t.integer :score

      t.timestamps
    end
  end
end
