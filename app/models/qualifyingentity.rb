class Qualifyingentity < ActiveRecord::Base
  attr_accessible :name, :classroom_id, :contentblock_ids, :qualifyingentity_criterion_ids, :score_ids
  has_many :score
  belongs_to :classroom
  has_many :qualifyingentity_criterions
  has_and_belongs_to_many :contentblocks
  #has_many :qualifyingentity
end
