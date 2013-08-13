class CreateAverageScores < ActiveRecord::Migration
  def change
    create_table :average_scores do |t|
      t.float :grade
      t.text :observations
      t.integer :student_id, :tlresult_id, :quarter_id
      t.timestamps
    end
  end
end
