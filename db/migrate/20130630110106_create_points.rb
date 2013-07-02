class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :student_id
      t.integer :profile_id
      t.integer :num
      t.datetime :point_datetime
      t.text :observations

      t.timestamps
    end
  end
end
