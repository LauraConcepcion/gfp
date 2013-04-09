class RemoveCodeToDepartmenttypes < ActiveRecord::Migration
  def up
    remove_column :departmenttypes, :code
  end

  def down
    add_column :departmenttypes, :code, :integer
  end
end
