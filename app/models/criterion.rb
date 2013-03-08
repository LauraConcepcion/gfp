class Criterion < ActiveRecord::Base
  attr_accessible :name, :content_id, :qualifyingentity_criterion_ids, :tlresult_ids
  belongs_to :content
  has_many :qualifyingentity_criterions
  has_many :qualifyingentities, :through => :qualifyingentity_criterions
  accepts_nested_attributes_for :qualifyingentities, :reject_if => :all_blank, :allow_destroy => true
  has_many :tlresults

end
