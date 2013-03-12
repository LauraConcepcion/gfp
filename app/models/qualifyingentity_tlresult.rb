class QualifyingentityTlresult < ActiveRecord::Base
  attr_accessible :qualifyingentity_id, :tlresult_id, :percentage

  belongs_to :qualifyingentity
  belongs_to :tlresult
end
