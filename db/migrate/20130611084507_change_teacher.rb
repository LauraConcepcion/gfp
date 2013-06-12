class ChangeTeacher < ActiveRecord::Migration
  def up
    add_column :teachers, :dni, :string
    add_column :teachers, :phone, :string
  end

  def down
    add_column :teachers, :dni
    add_column :teachers, :phone
  end
end
