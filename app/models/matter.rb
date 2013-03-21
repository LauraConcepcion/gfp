class Matter < ActiveRecord::Base
  attr_accessible :curso, :name, :classroom_ids, :department_id, :contentblock_ids, :trainercycle_id
  has_many :classrooms
  belongs_to :department
  has_many :contentblocks
  belongs_to :trainercycle
  validates :name , :presence => true

end
