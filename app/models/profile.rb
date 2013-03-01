class Profile < ActiveRecord::Base
  belongs_to :institute
  belongs_to :trainercycle
  belongs_to :matter
  belongs_to :teacher
  attr_accessible :institute_id, :trainercycle_id, :matter_id

  def name
    debugger
    self.name ||= self.trainercycletype.name
  end
end
