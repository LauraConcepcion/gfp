class AddCodeImportToDepartmenttypes < ActiveRecord::Migration
  def change
    add_column :departmenttypes, :code_import, :string
  end
end
