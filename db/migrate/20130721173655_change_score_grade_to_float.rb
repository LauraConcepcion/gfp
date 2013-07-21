class ChangeScoreGradeToFloat < ActiveRecord::Migration
  def change
    change_column :scores, :grade, :float
  end
end
