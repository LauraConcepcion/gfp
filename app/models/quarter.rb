class Quarter < ActiveRecord::Base
  attr_accessible :name, :contentblock_ids
  has_many :contentblocks
end