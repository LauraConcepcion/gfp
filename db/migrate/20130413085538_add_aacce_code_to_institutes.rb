class AddAacceCodeToInstitutes < ActiveRecord::Migration
  def change
    add_column :institutes, :aacce_code, :string
  end
end
