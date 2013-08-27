class Score < ActiveRecord::Base
  attr_accessible :grade, :observations, :url, :qualifyingentity_tlresult_id, :student_id
  belongs_to :qualifyingentity_tlresult, :inverse_of => :scores
  belongs_to :student, :inverse_of => :scores

  # FIXME Desactivada porque no funciona creando objetos temporales al editar los scores en el cuaderno del alumno
  #validates :grade, :presence => true
  validates :grade, :numericality => {:greater_than_or_equal_to => 0, :less_than_or_equal_to => 10}, :unless => :new_record?

  after_save :set_average_score

  def set_average_score
    if qualifyingentity_tlresult
      quarter = qualifyingentity_tlresult.qualifyingentity.quarter
      attrs = {:student_id => student_id, :tlresult_id => qualifyingentity_tlresult.tlresult_id, :quarter_id => quarter.id}
      average_score = AverageScore.where(attrs).first
      average_score ||= AverageScore.new(attrs)
      qualifyingentity_tlresults = Qualifyingentity.where(:quarter_id => quarter.id).map(&:qualifyingentity_tlresults).flatten.select {|qe_tlr| qe_tlr.percentage && qe_tlr.tlresult == qualifyingentity_tlresult.tlresult}
      scores = qualifyingentity_tlresults.map(&:scores).flatten.select {|score| student && score.student_id && score.student_id == student.id}
      grades_sum = scores.inject(0) {|sum, score| sum+((score.grade || 0)*score.qualifyingentity_tlresult.percentage/100.0)}
      num_activities = qualifyingentity_tlresults.inject(0) {|sum, qe_tlr| sum+(qe_tlr.percentage/100.0)}
      if grades_sum && num_activities > 0
        average_score.grade = grades_sum/num_activities
        average_score.save!
      end
    end
  end
end
