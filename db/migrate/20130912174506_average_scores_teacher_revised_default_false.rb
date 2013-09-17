class AverageScoresTeacherRevisedDefaultFalse < ActiveRecord::Migration
  def up
    change_column :average_scores, :teacher_revised, :boolean, :default => false
    AverageScore.where(:teacher_revised => nil).update_all(:teacher_revised => false)
  end

  def down
    change_column :average_scores, :teacher_revised
  end
end
