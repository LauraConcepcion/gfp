class Tlresult < ActiveRecord::Base
  attr_accessible :name, :criterion_ids
  has_many :qualifyingentity_tlresults
  has_many :criterions
end
