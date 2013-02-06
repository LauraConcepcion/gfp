class Teacher < ActiveRecord::Base
  attr_accessible :code, :name, :surname
  has_and_belongs_to_many :departments
end
