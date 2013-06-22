class Matter < ActiveRecord::Base
  attr_accessible :curso, :name, :contentblock_ids, :trainercycle_id, :m_id
  has_many :profiles
  has_many :contentblocks
  has_many :tlresults
  belongs_to :trainercycle
  validates :name , :presence => true

end
