class ObjetiveAverage < ActiveRecord::Base
  attr_accessible :average, :name, :objetive_id, :classroom_id
  belongs_to :objetive
  belongs_to :classroom
end
