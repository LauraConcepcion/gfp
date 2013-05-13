class ObjetiveAverage < ActiveRecord::Base
  attr_accessible :name, :objetive_id, :classroom_id
  belongs_to :objetive
  belongs_to :classroom
  validates :name, :presence => true

end
