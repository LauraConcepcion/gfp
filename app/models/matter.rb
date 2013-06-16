class Matter < ActiveRecord::Base
  attr_accessible :curso, :name, :contentblock_ids, :trainercycle_id, :m_id
  has_many :profiles
  has_many :contentblocks
  # FIXME Por ahora los asociamos a través de contentblocks pero luego serán directos seguramente
  has_many :tlresults, :through => :contentblocks
  belongs_to :trainercycle
  validates :name , :presence => true

end
