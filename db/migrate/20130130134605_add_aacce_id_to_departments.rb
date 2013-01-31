class AddAacceIdToDepartments < ActiveRecord::Migration
  def change
    add_column :departments, :aacce_id, :integer
  end
end
