class QualifyingentityAddDate < ActiveRecord::Migration
  def change
    add_column :qualifyingentities, :date, :date
  end
end
