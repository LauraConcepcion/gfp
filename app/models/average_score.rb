class AverageScore < ActiveRecord::Base
  attr_accessible :grade, :observations, :student_id, :tlresult_id, :quarter_id, :teacher_revised, :profile_id
  belongs_to :student, :inverse_of => :average_scores
  belongs_to :tlresult, :inverse_of => :average_scores
  belongs_to :quarter, :inverse_of => :average_scores
  belongs_to :profile, :inverse_of => :average_scores

  validates :grade, :numericality => true, :unless => :new_record?
  validates :quarter, :presence => true
  validates :student, :presence => true
  validates :profile, :presence => true

  after_save :update_quarter_average

  private

  def update_quarter_average
    if tlresult && !teacher_revised
      # Cambio de media de REA
      attrs = {:profile_id => profile_id, :student_id => student_id, :quarter_id => quarter_id, :tlresult_id => nil, :teacher_revised => false}
      average_score = AverageScore.where(attrs).first_or_initialize(attrs)
      # No hace falta filtrar por los que tienen tlresult no nulo porque ya lo hace el inner join
      quarter_averages = AverageScore.where(:profile_id => profile_id, :student_id => student_id, :quarter_id => quarter_id, :teacher_revised => false).where('tlresult_id is not null and grade is not null')
      # TODO Mejorar. Esto lo hacemos así porque los porcentajes los tenemos, no en registros sino en campos quarter_*
      # Tener en cuenta que la tabla esa ahora mismo hay que modificar los valores, no vale para años diferentes a no ser que se cambie de perfil (o REA)
      quarter_pos = Quarter.for_this_year.index(quarter) + 1
      percs_sum = nil
      grades_sum = quarter_averages.inject(0) do |sum, avg|
        tlr_perc = TlresultPercentage.where(:profile_id => profile_id, :tlresult_id => avg.tlresult_id).first
        # TODO revisar qué hacer con los que no están ponderados (se puede calcular la ponderación que falte hasta 100% o hacer media aritmética)
        next unless tlr_perc
        perc = tlr_perc.send("quarter_#{quarter_pos}").try(:to_f)
        next unless perc
        percs_sum ||= 0
        percs_sum += perc
        sum+avg.grade*perc
      end
      if grades_sum && percs_sum && percs_sum > 0
        average = grades_sum / percs_sum
        average_score.grade = average #TODO aquí actualizamos siempre?
        average_score.save
      end
    else
      # Cambio de media de trimestre
      # TODO cómo hacemos para la media anual?
    end
  end
end
