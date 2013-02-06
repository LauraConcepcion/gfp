class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :diasemana
      t.string :hora

      t.timestamps
    end
  end
end
