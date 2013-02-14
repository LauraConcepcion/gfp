class Schedule < ActiveRecord::Base
  attr_accessible :diasemana, :hora, :classroom_id
  belongs_to :classroom
end
