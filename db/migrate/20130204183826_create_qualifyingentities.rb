class CreateQualifyingentities < ActiveRecord::Migration
  def change
    create_table :qualifyingentities do |t|
      t.string :name

      t.timestamps
    end
  end
end
