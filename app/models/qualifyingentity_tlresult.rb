class QualifyingentityTlresult < ActiveRecord::Base
  attr_accessible :qualifyingentity_id, :tlresult_id, :percentage, :scores_attributes
  belongs_to :qualifyingentity
  belongs_to :tlresult

  has_many :scores, :inverse_of => :qualifyingentity_tlresult
  has_many :students, :through => :scores

  validates :tlresult_id, :presence => true
  validates_uniqueness_of :tlresult_id, :scope => :qualifyingentity_id
  #validates_associated :scores

  # FIXME Es necesario si hago el fields_for desde profile
  accepts_nested_attributes_for :scores, :allow_destroy => true
end
