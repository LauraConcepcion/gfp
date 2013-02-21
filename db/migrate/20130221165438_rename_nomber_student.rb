class RenameNomberStudent < ActiveRecord::Migration
  def up
    rename_column :students, :nomber, :nombre
  end

  def down
  end
end
