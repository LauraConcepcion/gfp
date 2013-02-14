class QualifyingentityCriterion < ActiveRecord::Base
  attr_accessible :percentage, :criterion_id, :qualifyingentity_id
  belongs_to :criterion
  belongs_to :qualifyingentity
end
