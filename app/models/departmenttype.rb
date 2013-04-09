class Departmenttype < ActiveRecord::Base
  attr_accessible :name, :code_import, :department_ids
  validates :name, :code, :presence => true
  has_many :departments
end
