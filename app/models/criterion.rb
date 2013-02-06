class Criterion < ActiveRecord::Base
  attr_accessible :name, :content_id
  belongs_to :content
  has_many :qualifyingentity_criterions
end
