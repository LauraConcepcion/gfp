class Tlresult < ActiveRecord::Base
  attr_accessible :name, :matter_id, :rayce_id 
  has_many :qualifyingentity_tlresults
  has_many :average_scores, :inverse_of => :qualifyingentity_tlresult
  has_many :criterions
  belongs_to :matter


  scope :for_matter_and_profile, lambda { |matter, profile|
    conds = ['matter_id = ?', matter.id]
    if profile
      conds[0] += ' and (profile_id is null or profile_id = ?)'
      conds << profile.id
    end
    where(conds)
  }


  def number
    if name =~ /^(\d+).*/
      $1.to_i
    else
      name[0]
    end
  end
end
