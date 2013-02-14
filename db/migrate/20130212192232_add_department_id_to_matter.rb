class AddDepartmentIdToMatter < ActiveRecord::Migration
  def change
    add_column :matters, :department_id, :integer
  end
end
