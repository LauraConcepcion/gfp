class CreateObjetives < ActiveRecord::Migration
  def change
    create_table :objetives do |t|
      t.string :name

      t.timestamps
    end
  end
end
