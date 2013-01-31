class AddAddressToInstitute < ActiveRecord::Migration
  def change
    add_column :institutes, :address, :string
  end
end
