class Trainercycle < ActiveRecord::Base
  attr_accessible :title, :edition,:description, :family, :cf_id, :cf_des, :cf_archivo, :trainercycletype_id, :matter_ids
  #, :classroom_ids
  #belongs_to :institute
  belongs_to :trainercycletype
  has_many :matters
#  has_many :classrooms
  validates :title , :presence => true
end
