class Group < ActiveRecord::Base
  attr_accessible :group_code, :name, :classroom_ids
  has_many :classrooms
  validates :name, :presence => true
  validates :group_code, :presence => true
end
