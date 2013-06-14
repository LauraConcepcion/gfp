class Objetive < ActiveRecord::Base
  attr_accessible :name, :objetive_average_ids, :trainercycle_id, :o_id
  belongs_to :trainercycle
  has_many :objetive_averages
  validates :name, :presence => true
end
