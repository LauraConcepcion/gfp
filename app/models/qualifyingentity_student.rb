class QualifyingentityStudent < ActiveRecord::Base
  attr_accessible :score
  belongs_to :qualifying_entity
  belongs_to :contentblock
end
