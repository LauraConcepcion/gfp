class Trainercycletype < ActiveRecord::Base
  attr_accessible :name, :trainercycles_id
  has_many :trainercycle
end
