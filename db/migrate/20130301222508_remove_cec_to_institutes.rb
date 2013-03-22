class RemoveCecToInstitutes < ActiveRecord::Migration
  def up
    remove_column :institutes, :cec
  end

  def down
  end
end
