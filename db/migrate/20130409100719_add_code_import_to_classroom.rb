class AddCodeImportToClassroom < ActiveRecord::Migration
  def change
    add_column :classrooms, :code_import, :string
  end
end
