class AddNameToTrainercycle < ActiveRecord::Migration
  def change
    add_column :trainercycles, :name, :string
  end
end
