class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :nomber
      t.string :apellidos
      t.string :code

      t.timestamps
    end
  end
end
