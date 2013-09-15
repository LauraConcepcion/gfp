class Score < ActiveRecord::Base
  attr_accessible :grade, :observations, :url, :qualifyingentity_tlresult_id, :student_id
  belongs_to :qualifyingentity_tlresult, :inverse_of => :scores
  belongs_to :student, :inverse_of => :scores

  # NOTE No usar la validación de presencia porque no funciona creando objetos temporales al editar los scores en el cuaderno del alumno
  validates :grade, :numericality => {:greater_than_or_equal_to => 0, :less_than_or_equal_to => 10}, :unless => :new_record?

  after_save :set_average_score

  # Tenemos las notas del alumno por actividad y REA (y trimestre por la actividad).
  # Por cada trimestre debemos tener la media por REA de todas las actividades.
  # y la media total el alumno, tanto la calculada como una manual del profesor.
  # Luego con las medias totales del alumno por trimestre se tiene una total calculada y otra manual.
  def set_average_score
    if qualifyingentity_tlresult
      quarter_id = qualifyingentity_tlresult.qualifyingentity.quarter_id
      attrs = {:student_id => student_id, :tlresult_id => qualifyingentity_tlresult.tlresult_id, :quarter_id => quarter_id, :profile_id => qualifyingentity_tlresult.qualifyingentity.profile_id, :teacher_revised => false}
      average_score = AverageScore.where(attrs).first_or_initialize(attrs)

      qe_tlrs = QualifyingentityTlresult.joins(:qualifyingentity).
                  where('qualifyingentities.quarter_id' => quarter_id,
                        'qualifyingentities.profile_id' => qualifyingentity_tlresult.qualifyingentity.profile_id,
                        'qualifyingentity_tlresults.tlresult_id' => qualifyingentity_tlresult.tlresult_id).
                  where('qualifyingentity_tlresults.percentage is not null')

      scores = Score.joins({:qualifyingentity_tlresult => :qualifyingentity}, :student).
                  where('scores.student_id' => student_id,
                        'qualifyingentity_tlresults.tlresult_id' => qualifyingentity_tlresult.tlresult_id,
                        'qualifyingentities.quarter_id' => quarter_id,
                        'qualifyingentities.profile_id' => qualifyingentity_tlresult.qualifyingentity.profile_id).
                  where('scores.grade is not null and qualifyingentity_tlresults.percentage is not null')

      grades_sum = scores.sum('grade*percentage').to_f
      percentages_sum = qe_tlrs.sum(:percentage)

      if grades_sum && percentages_sum > 0
        average_score.grade = grades_sum/percentages_sum
        average_score.save!
      end
    end
  end
end
