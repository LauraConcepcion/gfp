class AddCodeToInstitutes < ActiveRecord::Migration
  def change
    add_column :institutes, :code, :integer
    add_column :institutes, :cec, :string
    add_column :institutes, :locality, :string
    add_column :institutes, :zip, :string
    add_column :institutes, :city, :string
    add_column :institutes, :province, :string
    add_column :institutes, :fax, :string
    add_column :institutes, :holder, :string
    add_column :institutes, :type, :string
    add_column :institutes, :nature, :string
    add_column :institutes, :island, :string
  end
end
