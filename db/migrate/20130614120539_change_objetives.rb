class ChangeObjetives < ActiveRecord::Migration
  def up
    add_column :objetives, :o_id, :string
    add_column :objetives, :trainercicle_id, :integer
  end

  def down
    remove_column :objetives, :trainercicle_id
    remove_column :objetives, :o_id
  end
end
