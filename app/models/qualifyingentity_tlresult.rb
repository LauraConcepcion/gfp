class QualifyingentityTlresult < ActiveRecord::Base
  attr_accessible :qualifyingentity_id, :tlresult_id, :percentage
  belongs_to :qualifyingentity
  belongs_to :tlresult

  validates :tlresult_id, :percentage, :presence => true
  validates_uniqueness_of :tlresult_id, :scope => :qualifyingentity_id
end
