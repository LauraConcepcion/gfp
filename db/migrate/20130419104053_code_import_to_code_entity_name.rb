class CodeImportToCodeEntityName < ActiveRecord::Migration
  def up
    remove_column :departmenttypes, :code_import
    remove_column :groups, :code_import
    remove_column :teachers, :code_import
    remove_column :students, :code_import
    add_column :departmenttypes, :departmenttype_code, :string
    add_column :groups, :group_code, :string
    add_column :teachers, :teacher_code, :string
    add_column :students, :student_code, :string
  end

  def down
  end
end
