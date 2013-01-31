class RemoveDepartmentIdToInstitute < ActiveRecord::Migration
  def up
    remove_column :institutes, :department_id
  end

  def down
    add_column :institutes, :department_id, :string
  end
end
