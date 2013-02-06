class Group < ActiveRecord::Base
  attr_accessible :code, :name, :classroom_id
  belongs_to :classroom
end
