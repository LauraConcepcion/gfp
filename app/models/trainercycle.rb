class Trainercycle < ActiveRecord::Base
  attr_accessible :edition, :numanios, :turno, :institute_id, :trainercycletype_id, :matters_id, :classrooms_id
  belongs_to :institute
  belongs_to :trainercycletype
  has_many :matters
  has_many :classrooms
end
