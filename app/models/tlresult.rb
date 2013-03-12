class Tlresult < ActiveRecord::Base
  attr_accessible :name, :criterion_ids, :contentblock_id
  belongs_to :contentblock
  has_many :criterions
end
