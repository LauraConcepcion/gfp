class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.integer :student_id
      t.integer :profile_id
      t.datetime :observation_datetime
      t.text :text

      t.timestamps
    end
  end
end
