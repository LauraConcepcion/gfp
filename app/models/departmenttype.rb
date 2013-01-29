class Departmenttypes < ActiveRecord::Base
  attr_accessible validates :name, :code, :presence => true
  has_many :departments
end
