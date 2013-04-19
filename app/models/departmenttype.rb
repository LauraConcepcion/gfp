class Departmenttype < ActiveRecord::Base
  attr_accessible :name, :departmenttype_code, :department_ids
  validates :name, :code, :presence => true
  has_many :departments
end
