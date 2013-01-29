class CreateAacces < ActiveRecord::Migration
  def change
    create_table :aacces do |t|
      t.string :name

      t.timestamps
    end
  end
end
