class AverageScoresAddProfileId < ActiveRecord::Migration
  def change
    add_column :average_scores, :profile_id, :integer
  end
end
