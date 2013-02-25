class Trainercycle < ActiveRecord::Base
  attr_accessible :name, :edition, :numanio, :turno, :institute_id, :trainercycletype_id, :matter_ids, :classroom_ids
  belongs_to :institute
  belongs_to :trainercycletype
  has_many :matters
  has_many :classrooms
end
