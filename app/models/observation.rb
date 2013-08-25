class Observation < ActiveRecord::Base
  attr_accessible :profile_id, :student_id, :text, :observation_datetime
  belongs_to :student
  belongs_to :profile

  scope :for_profile_and_student_and_quarter, lambda {|profile, student, quarter|
    where('profile_id = ? and student_id = ? and observation_datetime >= ? and observation_datetime < ?', profile.id, student.id, quarter.start_date, quarter.end_date)
  }
end
