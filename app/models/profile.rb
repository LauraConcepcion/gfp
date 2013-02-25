class Profile < ActiveRecord::Base
  belongs_to :institute
  belongs_to :trainercycle
  belongs_to :matter
  belongs_to :teacher
  # attr_accessible :title, :body
end
