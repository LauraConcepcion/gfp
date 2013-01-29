class CreateTrainercycles < ActiveRecord::Migration
  def change
    create_table :trainercycles do |t|
      t.string :turno
      t.string :numaios
      t.string :edition

      t.timestamps
    end
  end
end
