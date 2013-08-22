class TlresultsAddProfileId < ActiveRecord::Migration
  def change
    add_column :tlresults, :profile_id, :integer
  end
end
