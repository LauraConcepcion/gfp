class QualifyingentityStudent < ActiveRecord::Base
  attr_accessible :score, :qualifyingentity_id, :contentblock_id, :student_id
  belongs_to :qualifyingentity
  belongs_to :student
  belongs_to :contentblock
end
