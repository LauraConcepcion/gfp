class Score < ActiveRecord::Base
  attr_accessible :grade, :qualifyingentity_tlresult_id, :student_id
  belongs_to :qualifyingentity_tlresult, :inverse_of => :scores
  belongs_to :student, :inverse_of => :scores

  # FIXME Desactivada porque no funciona creando objetos temporales al editar los scores en el cuaderno del alumno
  #validates :grade, :presence => true
end
