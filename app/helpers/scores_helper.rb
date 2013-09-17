module ScoresHelper
  def score_for(record)
    value = record.try(:grade) ? number_with_precision(record.grade, :precision => 2) : '-'
    value = value.gsub(/[,.]00$/, '').gsub(/(\d+[,.]\d)0$/, '\1')
    value
  end
end
