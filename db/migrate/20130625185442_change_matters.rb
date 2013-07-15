class ChangeMatters < ActiveRecord::Migration
  def change
    change_column :matters, :m_id, :string
  end
end
