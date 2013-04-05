class AddCodeToAacce < ActiveRecord::Migration
  def change
    add_column :aacces, :code, :string
  end
end
