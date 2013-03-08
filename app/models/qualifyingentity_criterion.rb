class QualifyingentityCriterion < ActiveRecord::Base
  attr_accessible :percentage, :criterion_id, :qualifyingentity_id, :profile_id
  belongs_to :criterion
  belongs_to :qualifyingentity
  belongs_to :profile
  def qualifyingentities_attr=(qualifyingentities_attr)  
    qualifyingentities_attr.each do |attributes|
      qualifyingentities.build(attributes)
    end
  end
end
