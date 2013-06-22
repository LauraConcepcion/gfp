class Classroom < ActiveRecord::Base
  attr_accessible  :code, :name, :student_ids, :profile_ids, :students_attributes
  validate :name, :profiles , :presence => true
  
  has_many :students
  has_many :profiles
  
  has_many :schedule
  has_many :qualifyingentities
  has_many :objetive_averages

  accepts_nested_attributes_for :students, :allow_destroy => true, :reject_if => :all_blank

end
