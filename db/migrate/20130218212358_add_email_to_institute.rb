class AddEmailToInstitute < ActiveRecord::Migration
  def change
    add_column :institutes, :email, :string
  end
end
