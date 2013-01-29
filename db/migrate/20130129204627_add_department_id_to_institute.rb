class AddDepartmentIdToInstitute < ActiveRecord::Migration
  def change
    add_column :institutes, :department_id, :integer
  end
end
