class AverageScoresTeacherRevised < ActiveRecord::Migration
  def change
    add_column :average_scores, :teacher_revised, :boolean
  end
end
