class RemovecolumnComAndAddTypecenterToInstitute < ActiveRecord::Migration
  def up
    remove_column :institutes, :com
    add_column :institutes, :type_center, :string
  end

  def down
  end
end
