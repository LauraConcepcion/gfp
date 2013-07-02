class Point < ActiveRecord::Base
  attr_accessible :num, :observations, :point_datetime, :profile_id, :student_id

  belongs_to :student
  belongs_to :profile

  scope :for_profile_and_student, lambda {|profile, student| where(:profile_id => profile, :student_id => student)}
end
