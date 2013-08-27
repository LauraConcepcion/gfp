class TlresultPercentage < ActiveRecord::Base
  attr_accessible :quarter_1, :quarter_2, :quarter_3, :global, :profile_id, :tlresult_id

  belongs_to :profile
  belongs_to :tlresult
end
