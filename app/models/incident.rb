class Incident < ActiveRecord::Base
  attr_accessible :incident_datetime, :observations, :profile_id, :student_id
  belongs_to :student
  belongs_to :profile

  scope :for_profile_and_student_and_quarter, lambda {|profile, student, quarter|
    where('profile_id = ? and student_id = ? and incident_datetime >= ? and incident_datetime < ?', profile.id, student.id, quarter.start_date, quarter.end_date)
  }
end
