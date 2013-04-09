class Aacce < ActiveRecord::Base
  attr_accessible :name, :code_import
  validates :name, :presence => true
  has_many :institutes
  has_many :departments
end
