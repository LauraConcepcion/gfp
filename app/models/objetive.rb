class Objetive < ActiveRecord::Base
  attr_accessible :name, :objetive_matter_ids
  has_many :objetive_matters
end
