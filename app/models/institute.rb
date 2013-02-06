class Institute < ActiveRecord::Base
  attr_accessible :name, :address, :aacce_id
  validates :name, :address, :presence => true
  belongs_to  :aacce
  has_many :departments
  attr_accessible :department_ids
  has_many :trainercycles
  attr_accessible :trainercycle_ids
end
