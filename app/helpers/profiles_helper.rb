module ProfilesHelper
  def qe_title(qualifyingentity)
    title = qualifyingentity.name
    title += " (#{I18n.l(qualifyingentity.date, :format => :default)})" if qualifyingentity.date
    title
  end

  def average_for(student, tlr, quarter_id, profile_id)
    average_score = AverageScore.where(:student_id => student.id, :tlresult_id => tlr.try(:id), :quarter_id => quarter_id, :profile_id => profile_id, :teacher_revised => false).first
    average_score ? number_with_precision(average_score.grade, :precision => 2) : '-'
  end

  def even_odd(count)
    count % 2 == 0 ? 'even' : 'odd'
  end
end
