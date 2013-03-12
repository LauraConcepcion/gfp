class AddGroupIdToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :group_id, :integer
  end
end
