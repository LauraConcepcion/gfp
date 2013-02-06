class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :name
      t.string :code
      t.integer :score

      t.timestamps
    end
  end
end
