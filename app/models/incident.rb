class Incident < ActiveRecord::Base
  attr_accessible :incident_datetime, :observations, :profile_id, :student_id
end
