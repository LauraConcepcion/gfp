class Institute < ActiveRecord::Base
  attr_accessible :name, :address 
  validates :name, :address, :presence => true
  belongs_to  :aacc
  has_many :departments
  attr_accessible :department_ids
  has_many :trainercycles
end
