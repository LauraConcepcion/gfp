class Classroom < ActiveRecord::Base
  attr_accessible  :code, :name, :student_ids, :profile_id, :students_attributes

  has_and_belongs_to_many :students
  # has_many :students, :inverse_of => :classroom, :order => 'firstsurname ASC, secondsurname ASC, name ASC'
  # # has_many :profiles
  belongs_to :profile
  validates_uniqueness_of :profile_id

  has_many :schedule
  has_many :qualifyingentities
  has_many :objetive_averages

  validates_presence_of :name, :profile
  # before_validation :check_profiles

  accepts_nested_attributes_for :students, :allow_destroy => true, :reject_if => :all_blank


  private

  def check_profiles
    errors.add :profile, I18n.t(:one_record_must_be_selected, :scope => 'activerecord.errors.messages') if self.profile.nil?
  end
end
