class Content < ActiveRecord::Base
  attr_accessible :name, :criterion_id
  belongs_to :criterion
  belongs_to :contentblock
end
