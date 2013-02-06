class AddCodeToDepartmenttype < ActiveRecord::Migration
  def change
    add_column :departmenttypes, :code, :string
  end
end
