class ChageTrainerCicle < ActiveRecord::Migration
  def up
    add_column :trainercycles, :cf_id, :string
    add_column :trainercycles, :cf_des, :string
    add_column :trainercycles, :cf_archivo, :string
    add_column :trainercycles, :title, :string
    add_column :trainercycles, :description, :string
    add_column :trainercycles, :family, :string
    remove_column :trainercycles, :name
    remove_column :trainercycles, :edition
    remove_column :trainercycles, :numanio
    remove_column :trainercycles, :turno
  end

  def down
    add_column :trainercycles, :turno, :string
    add_column :trainercycles, :numanio, :string
    add_column :trainercycles, :edition, :string
    add_column :trainercycles, :name, :string
    remove_column :trainercycles, :family
    remove_column :trainercycles, :description
    remove_column :trainercycles, :title
    remove_column :trainercycles, :cf_archivo
    remove_column :trainercycles, :cf_des
    remove_column :trainercycles, :cf_id
  end
end
