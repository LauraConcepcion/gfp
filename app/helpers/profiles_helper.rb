module ProfilesHelper
  def qe_title(qualifyingentity)
    title = qualifyingentity.name
    title += " (#{I18n.l(qualifyingentity.date, :format => :default)})" if qualifyingentity.date
    title
  end

  def average_for(student, tlr, quarter_id, profile_id)
    average_score = AverageScore.where(:student_id => student.id, :tlresult_id => tlr.try(:id), :quarter_id => quarter_id, :profile_id => profile_id, :teacher_revised => false).first
    value = average_score.try(:grade) ? number_with_precision(average_score.grade, :precision => 2) : '-'
    value = value.gsub(/[,.]00$/, '').gsub(/(\d+[,.]\d)0$/, '\1')
    value
  end

  def even_odd(count)
    count % 2 == 0 ? 'even' : 'odd'
  end
end
