class Teacher < ActiveRecord::Base
  attr_accessible :code, :name, :surname, :classroom_ids, :department_ids
  has_and_belongs_to_many :departments
  has_many :classrooms
  has_many :profile
end
