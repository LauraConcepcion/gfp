class Group < ActiveRecord::Base
  attr_accessible :code_import, :name, :classroom_ids
  has_many :classrooms
  validates :name, :presence => true
end
