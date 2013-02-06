class AddDepartmenttypeIdToDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :departmenttype_id, :integer
  end
end
