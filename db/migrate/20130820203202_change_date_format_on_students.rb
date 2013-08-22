class ChangeDateFormatOnStudents < ActiveRecord::Migration
  def up
    change_column :students, :birthdate, :date
  end

  def down
    change_column :students, :birthdate, :datetime
  end
end
