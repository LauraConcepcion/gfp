class AddCodeImportToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :code_import, :string
  end
end
