class Tlresult < ActiveRecord::Base
  attr_accessible :name, :matter_id, :rayce_id 
  has_many :qualifyingentity_tlresults
  has_many :criterions
  belongs_to :matter
end
