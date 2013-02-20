class AddPhoneToInstitute < ActiveRecord::Migration
  def change
    add_column :institutes, :phone, :string
  end
end
