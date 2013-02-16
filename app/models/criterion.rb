class Criterion < ActiveRecord::Base
  attr_accessible :name, :content_id, :qualifyingentity_criterion_ids, :tlresult_ids
  belongs_to :content
  has_many :qualifyingentity_criterions
  has_and_belongs_to_many :tlresults

end