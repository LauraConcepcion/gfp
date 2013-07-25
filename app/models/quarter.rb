class Quarter < ActiveRecord::Base
  attr_accessible :name, :contentblock_ids, :start_date, :end_date, :quarter_id
  has_many :contentblocks
  has_many :qualifyingentities
  validates :name, :presence => true
end
