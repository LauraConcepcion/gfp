class Tlresult < ActiveRecord::Base
  attr_accessible :name, :criterion_ids
  has_and_belongs_to_many :criterions
end
