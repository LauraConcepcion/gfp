class ChangeAacce < ActiveRecord::Migration
  def up
    add_column :aacces, :aacce_code, :string
    remove_column :aacces, :code_import
  end

  def down
    remove_column :aacces, :aacce_code
    add_column :aacces, :code_import, :string
 end
end
