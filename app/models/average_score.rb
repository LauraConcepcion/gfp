class AverageScore < ActiveRecord::Base
  attr_accessible :grade, :observations, :student_id, :tlresult_id, :quarter_id
  belongs_to :student, :inverse_of => :average_scores
  belongs_to :tlresult, :inverse_of => :average_scores
  belongs_to :quarter, :inverse_of => :average_scores

  validates :grade, :numericality => true, :unless => :new_record?
end
