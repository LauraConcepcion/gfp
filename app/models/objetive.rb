class Objetive < ActiveRecord::Base
  attr_accessible :name, :objetive_average_ids
  has_many :objetive_averages
  validates :name, :presence => true
end
