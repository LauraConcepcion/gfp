class ChangeTlResult < ActiveRecord::Migration
  def up
     add_column :tlresults, :matter_id, :integer
     add_column :tlresults, :rayce_id, :string
     change_column :tlresults, :name, :text
  end

  def down
     change_column :tlresults, :name, :string
     remove_column :tlresults, :rayce_id
     remove_column :tlresults, :matter_id
  end
end
