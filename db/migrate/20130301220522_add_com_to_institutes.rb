class AddComToInstitutes < ActiveRecord::Migration
  def change
    add_column :institutes, :com, :string
  end
end
