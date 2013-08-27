class CreateTlresultPercentages < ActiveRecord::Migration
  def change
    create_table :tlresult_percentages do |t|
      t.float :quarter_1, :quarter_2, :quarter_3, :global
      t.references :profile, :tlresult
      t.timestamps
    end
  end
end
