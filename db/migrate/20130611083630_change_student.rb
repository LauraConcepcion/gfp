class ChangeStudent < ActiveRecord::Migration
  def up
    add_column :students, :firstsurname, :string
    add_column :students, :secondsurname, :string
    add_column :students, :name, :string
    add_column :students, :dni, :string
    add_column :students, :mail, :string
    add_column :students, :phone, :string
    
    remove_column :students, :apellidos
    remove_column :students, :nombre
  end

  def down
    remove_column :students, :firstsurname
    remove_column :students, :secondsurname
    remove_column :students, :name
    remove_column :students, :dni
    remove_column :students, :mail
    remove_column :students, :phone
    
    add_column :students, :apellidos, :string
    add_column :students, :nombre, :string

  end
end
