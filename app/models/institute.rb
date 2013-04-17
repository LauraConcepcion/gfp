class Institute < ActiveRecord::Base
  attr_accessible :name, :address, :aacce_id, :phone, :email, :web, :locality, :zip, :city, :province, :fax, :holder, :type, :nature, :island, :institute_code
  validates :name, :institute_code, :presence => true
  #validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  #validates :web, :format => {:with => /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/}
  belongs_to  :aacce
  #has_many :departments
  #attr_accessible :department_ids
#  has_many :trainercycles
  #attr_accessible :trainercycle_ids
end
