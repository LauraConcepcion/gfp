class Quarter < ActiveRecord::Base
  attr_accessible :name, :content_ids
  has_many :contents
end
