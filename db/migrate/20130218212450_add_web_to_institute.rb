class AddWebToInstitute < ActiveRecord::Migration
  def change
    add_column :institutes, :web, :string
  end
end
