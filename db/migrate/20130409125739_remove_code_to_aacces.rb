class RemoveCodeToAacces < ActiveRecord::Migration
  def up
    remove_column :accees, :code
  end

  def down
  end
end
