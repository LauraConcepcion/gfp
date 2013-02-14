class Matter < ActiveRecord::Base
  attr_accessible :curso, :name, :classroom_ids, :department_id, :contentblock_id
  has_many :classrooms
  belongs_to :department
  belongs_to :contentblock

end
