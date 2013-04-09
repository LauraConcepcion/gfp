class RemoveCodeToInstitutes < ActiveRecord::Migration
  def up
    remove_column :institutes, :code
  end

  def down
    add_column :institutes, :code, :integer
  end
end
