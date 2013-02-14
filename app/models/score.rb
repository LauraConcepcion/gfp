class Score < ActiveRecord::Base
  attr_accessible :grade, :qualifyingentity_id, :student_id
  belongs_to :qualifyingentity
  belongs_to :student
end
