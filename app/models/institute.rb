class Institute < ActiveRecord::Base
  attr_accessible :name, :address 
  validates :name, :address, :presence => true
  belongs_to  :aacc
  has_many :departments
  has_many :trainercycles
end
