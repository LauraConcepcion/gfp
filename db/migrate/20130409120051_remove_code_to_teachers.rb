class RemoveCodeToTeachers < ActiveRecord::Migration
  def up
    remove_column :teachers, :code
  end

  def down
    add_column :teachers, :code, :integer
  end
end
