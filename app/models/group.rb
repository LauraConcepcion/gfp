class Group < ActiveRecord::Base
  attr_accessible :code, :name
  has_many :classrooms
end
