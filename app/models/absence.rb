class Absence < ActiveRecord::Base
  attr_accessible :absence_datetime, :justified, :observations, :profile_id, :student_id

  belongs_to :student
  belongs_to :profile
  
  scope :for_profile_and_student_and_quarter, lambda {|profile, student, quarter|
    where('profile_id = ? and student_id = ? and absence_datetime::date >= ? and absence_datetime::date < ?', profile.id, student.id, quarter.start_date, quarter.end_date)
  }
end
