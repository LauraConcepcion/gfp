class AddCodeImportToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :code_import, :string
  end
end
