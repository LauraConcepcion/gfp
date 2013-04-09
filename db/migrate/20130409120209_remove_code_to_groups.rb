class RemoveCodeToGroups < ActiveRecord::Migration
  def up
    remove_column :groups, :code
  end

  def down
    add_column :groups, :code, :integer
  end
end
