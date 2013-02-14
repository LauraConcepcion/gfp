class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :grade
      t.timestamps
    end
  end
end
