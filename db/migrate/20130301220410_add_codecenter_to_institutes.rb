class AddCodecenterToInstitutes < ActiveRecord::Migration
  def change
    add_column :institutes, :codecenter, :string
  end
end
