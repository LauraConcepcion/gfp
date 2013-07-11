class StudentAddAttributes < ActiveRecord::Migration
  def change
    add_column :students, :record, :string
    add_column :students, :birthdate, :datetime
  end
end
