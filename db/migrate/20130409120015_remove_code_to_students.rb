class RemoveCodeToStudents < ActiveRecord::Migration
  def up
    remove_column :students, :code
  end

  def down
    add_column :students, :code, :integer
  end
end
