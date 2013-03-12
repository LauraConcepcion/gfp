class Criterion < ActiveRecord::Base
  attr_accessible :name, :content_id, :tlresult_id
  belongs_to :content
  belongs_to :tlresult
end
