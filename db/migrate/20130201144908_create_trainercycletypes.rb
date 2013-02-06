class CreateTrainercycletypes < ActiveRecord::Migration
  def change
    create_table :trainercycletypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
