class CreateObjetiveAverages < ActiveRecord::Migration
  def change
    create_table :objetive_averages do |t|
      t.string :name
      t.integer :average

      t.timestamps
    end
  end
end
