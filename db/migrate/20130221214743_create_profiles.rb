class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :institute
      t.references :trainercycle
      t.references :matter

      t.timestamps
    end
    add_index :profiles, :institute_id
    add_index :profiles, :trainercycle_id
    add_index :profiles, :matter_id
  end
end
