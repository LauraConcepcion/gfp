class CriterionQualifyingentity < ActiveRecord::Base
  attr_accessible :percentage, :qualifyingentity_id, :criterion_id
  belongs_to  :qualifyingentity
  belongs_to  :criterion
end
