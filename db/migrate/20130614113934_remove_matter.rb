class RemoveMatter < ActiveRecord::Migration
  def up
    remove_column :matters, :department_id
    add_column :matters, :m_id, :integer
  end

  def down
    remove_column :matters, :m_id
    add_column :matters, :department_id
  end
end
