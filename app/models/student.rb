class Student < ActiveRecord::Base
  attr_accessible :apellidos, :code_import, :nombre, :score_ids, :classroom_ids
  has_many :scores
  has_many :classrooms
end
