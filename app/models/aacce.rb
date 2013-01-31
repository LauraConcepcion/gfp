class Aacce < ActiveRecord::Base
  attr_accessible :name, :institute_ids, :department_ids
  validates :name, :presence => true
  has_many :institutes
  has_many :departments
end
