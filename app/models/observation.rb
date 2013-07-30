class Observation < ActiveRecord::Base
  attr_accessible :profile_id, :student_id, :text, :observation_datetime
  belongs_to :student
  belongs_to :profile

  scope :for_profile_and_student, lambda {|profile, student| where(:profile_id => profile, :student_id => student)}

end
