class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.integer :student_id
      t.integer :profile_id
      t.datetime :incident_datetime
      t.text :observations

      t.timestamps
    end
  end
end
