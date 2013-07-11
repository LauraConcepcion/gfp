class ScoresAddObservations < ActiveRecord::Migration
  def change
    add_column :scores, :observations, :text
  end
end
