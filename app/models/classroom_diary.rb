class ClassroomDiary < ActiveRecord::Base
  attr_accessible :description, :profile_id, :created_at

  belongs_to :profile

  scope :for_profile, lambda {|profile|
    where("profile_id = ?", profile.id) if profile
  }

end
