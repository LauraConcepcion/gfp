class AddContentIdToCriterion < ActiveRecord::Migration
  def change
    add_column :criterions, :content_id, :integer
  end
end
