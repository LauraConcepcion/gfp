class AddAacceIdToInstitute < ActiveRecord::Migration
  def change
    add_column :institutes, :aacce_id, :integer
  end
end
