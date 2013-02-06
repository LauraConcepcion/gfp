class Contentblock < ActiveRecord::Base
  attr_accessible :name, :quarter_id, :content_ids, :qualifying_entities_ids
  has_many :contents
  belongs_to :quarter
  has_and_belongs_to_many :qualifying_entities
  has_many :qualifyingentity_contentblocks
end
