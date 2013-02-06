class CreateTlresults < ActiveRecord::Migration
  def change
    create_table :tlresults do |t|
      t.string :name

      t.timestamps
    end
  end
end
