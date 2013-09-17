class Tlresult < ActiveRecord::Base
  attr_accessible :name, :matter_id, :rayce_id 
  has_many :qualifyingentity_tlresults
  has_many :average_scores, :inverse_of => :qualifyingentity_tlresult
  has_many :criterions
  has_many :tlresult_percentages
  belongs_to :matter


  scope :for_matter_and_profile, lambda { |matter, profile|
    conds = ['matter_id = ?', matter.id]
    if profile
      conds[0] += ' and (profile_id is null or profile_id = ?)'
      conds << profile.id
    end
    where(conds)
  }

  scope :unique_for_profile_and_quarter, lambda { |profile, quarter|
    joins(:qualifyingentity_tlresults => :qualifyingentity).
    where('qualifyingentities.profile_id = ? and qualifyingentities.quarter_id = ?', profile.id, quarter.id).
    select('distinct tlresults.*')
  }

  scope :unique_for_profile, lambda { |profile|
    joins(:qualifyingentity_tlresults => :qualifyingentity).
    where('qualifyingentities.profile_id = ?', profile.id).
    select('distinct tlresults.*')
  }

  def sortable_item
    name =~ /((\d+)\.)?(.*?)$/
    [$2.try(:to_i), $3.try(:strip)].compact
  end

  def number
    if name =~ /^(\d+).*/
      $1.to_i
    else
      name[0]
    end
  end
end
