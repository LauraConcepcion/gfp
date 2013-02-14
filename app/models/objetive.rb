class Objetive < ActiveRecord::Base
  attr_accessible :name, :objetiveaverage_ids
  has_many :objetiveaverages
end
