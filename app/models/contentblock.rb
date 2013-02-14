class Contentblock < ActiveRecord::Base
  attr_accessible :name, :quarter_id, :matter_id, :content_ids, :qualifyingentity_ids
  has_many :contents
  belongs_to :quarter
  belongs_to :matter
  has_and_belongs_to_many :qualifyingentities
#  has_many :qualifyingentity_contentblocks
end
