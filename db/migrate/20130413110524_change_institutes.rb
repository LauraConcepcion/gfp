class ChangeInstitutes < ActiveRecord::Migration
  def up
    add_column :institutes, :institute_code, :string
    remove_column :institutes, :code_import
  end

  def down
    remove_column :institutes, :insitute_code
    add_column :institutes, :code_import, :string
  end
end
