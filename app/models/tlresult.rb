class Tlresult < ActiveRecord::Base
  attr_accessible :name, :criterion_ids, :contentblock_id
  has_one :contentblock
  has_many :qualifyingentity_tlresults
  has_many :criterions
end
