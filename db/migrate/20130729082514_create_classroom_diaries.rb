class CreateClassroomDiaries < ActiveRecord::Migration
  def change
    create_table :classroom_diaries do |t|
      t.text :description 
      t.references :profile
      t.timestamps
    end
  end
end
