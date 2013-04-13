class Aacce < ActiveRecord::Base
  attr_accessible :name, :aacce_code
  validates :name, :presence => true
  has_many :institutes
  has_many :departments
end
