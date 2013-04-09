class AddCodeImportToStudents < ActiveRecord::Migration
  def change
    add_column :students, :code_import, :string
  end
end
