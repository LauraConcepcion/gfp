class Tlresult < ActiveRecord::Base
  attr_accessible :name, :criterion_ids, :contentblock_id
  has_and_belongs_to_many :criterions
  belongs_to :contentblock
end
