class Classroom < ActiveRecord::Base
  attr_accessible  :code, :name, :trainercycle_id, :teacher_id, :student_id, :group_id, :matter_id, :schedule_ids, :qualifyingentity_ids
  belongs_to :trainercycle, :foreign_key => 'trainercycle_id'
  belongs_to :teacher
  belongs_to :student
  belongs_to :group
  belongs_to :matter
  has_many :schedule
  has_many :qualifyingentities
  has_many :objetive_averages


end
