class TlresultPercentage < ActiveRecord::Base
  attr_accessible :quarter_1, :quarter_2, :quarter_3, :global, :profile_id, :tlresult_id

  belongs_to :profile
  belongs_to :tlresult

  validates :profile, :presence => true
  validates :tlresult, :presence => true
  validates :quarter_1, :numericality => {:less_than_or_equal_to => 100, :greater_than => 0}, :allow_nil => true
  validates :quarter_2, :numericality => {:less_than_or_equal_to => 100, :greater_than => 0}, :allow_nil => true
  validates :quarter_3, :numericality => {:less_than_or_equal_to => 100, :greater_than => 0}, :allow_nil => true
  validates :global, :numericality => {:less_than_or_equal_to => 100, :greater_than => 0}, :allow_nil => true
end
