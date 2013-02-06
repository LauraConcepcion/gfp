class Qualifyingentity < ActiveRecord::Base
  attr_accessible :name, :classroom_id, :contentblocks_ids
  belongs_to :classroom
  has_many :qualifyingentity_criterions
  has_and_belongs_to_many :contentblocks
  has_many :qualifyingentity
end
