class Department < ActiveRecord::Base
  attr_accessible :name, :institute_id
  validates :name, :presence => true
  belongs_to :aacc
  belongs_to :institute
  has_many :modules
  belongs_to :departamenttype
end
