class AddCodeImportToInstitutes < ActiveRecord::Migration
  def change
    add_column :institutes, :code_import, :string
    remove_column :institutes, :type
  end
end
