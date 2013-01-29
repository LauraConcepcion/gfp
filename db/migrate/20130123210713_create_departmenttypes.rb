class CreateDepartmenttypes < ActiveRecord::Migration
  def change
    create_table :departmenttypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
