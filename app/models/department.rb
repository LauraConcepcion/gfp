class Department < ActiveRecord::Base
  attr_accessible :name
  validates :name, :presence => true
  belongs_to :aacc
  belongs_to :institute
  has_many :modules
  belongs_to :departamenttype
end
