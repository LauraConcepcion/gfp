class Quarter < ActiveRecord::Base
  attr_accessible :name, :contentblock_ids, :start_date, :end_date
  has_many :contentblocks
  has_many :qualifyingentities
  has_many :average_scores, :inverse_of => :quarter
  validates :name, :presence => true

  scope :for_this_year, lambda {
    start_year = "#{Date.today.year}-09-01".to_date
    end_year = "#{Date.today.year+1}-06-30".to_date
    where('start_date >= ? and end_date <= ?', start_year, end_year).order(:start_date)
  }
end
