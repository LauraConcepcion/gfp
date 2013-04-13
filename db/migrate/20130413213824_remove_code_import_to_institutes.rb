class RemoveCodeImportToInstitutes < ActiveRecord::Migration
  def up
    remove_column :institutes, :aacce_code
    remove_column :institutes, :codecenter
    remove_column :aacces, :code
  end
end
