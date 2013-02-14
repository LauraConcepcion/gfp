class Department < ActiveRecord::Base
  attr_accessible :name, :institute_id, :aacce_id, :departmenttype_id, :teacher_ids
  validates :name, :presence => true
  belongs_to :aacce
  belongs_to :institute
  has_many :modules
  belongs_to :departmenttype
  has_and_belongs_to_many :teachers
end
