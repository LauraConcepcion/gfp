class AddCodeImportToAacce < ActiveRecord::Migration
  def change
    add_column :aacces, :code_import, :string
  end
end
