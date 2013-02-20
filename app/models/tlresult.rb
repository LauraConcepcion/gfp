class Tlresult < ActiveRecord::Base
  attr_accessible :name, :criterion_id, :contentblock_id
  belongs_to :criterion
  belongs_to :contentblock
end
