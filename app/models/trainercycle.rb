class Trainercycle < ActiveRecord::Base
  attr_accessible :name, :edition, :numanio, :turno, :trainercycletype_id, :matter_ids, :classroom_ids
  #belongs_to :institute
  belongs_to :trainercycletype
  has_many :matters
  has_many :classrooms
  validates :name , :presence => true
end
