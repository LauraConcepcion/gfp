class CreateAbsences < ActiveRecord::Migration
  def change
    create_table :absences do |t|
      t.integer :student_id
      t.integer :profile_id
      t.datetime :absence_datetime
      t.boolean :justified
      t.text :observations

      t.timestamps
    end
  end
end
