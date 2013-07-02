class Absence < ActiveRecord::Base
  attr_accessible :absence_datetime, :justified, :observations, :profile_id, :student_id
end
