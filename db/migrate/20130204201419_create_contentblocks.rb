class CreateContentblocks < ActiveRecord::Migration
  def change
    create_table :contentblocks do |t|
      t.string :name

      t.timestamps
    end
  end
end
