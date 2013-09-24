class Qualifyingentity < ActiveRecord::Base
  attr_accessible :name, :date, :profile_id, :qualifyingentity_tlresults_attributes, :created_at, :quarter, :quarter_id

  #Mediante profile se determina la asignatura para la que se están creando las entidades calificables
  belongs_to :profile

  #Trimestre al que pertenece
  belongs_to :quarter
  
  #Relación con los tlresult y sus porcentajes
  has_many :qualifyingentity_tlresults, :include => :tlresult, :order => 'tlresults.name', :dependent => :destroy
  has_many :tlresults, :through => :qualifyingentity_tlresults, :order => 'name ASC'

  has_many :qualifyingentity_criterions
  has_many :criterions, :through => :qualifyingentity_criterions
  has_and_belongs_to_many :contentblocks

  accepts_nested_attributes_for :qualifyingentity_tlresults, :reject_if => :all_blank, :allow_destroy => true

  # before_destroy :can_be_destroyed?
  #FIXME Necesario?
  # after_save :create_qualifyingentity_tlresults

  validates :name, :quarter_id, :presence => true
  validates :profile_id, :presence => true

  validates_associated :qualifyingentity_tlresults

  #before_save :set_quarter, :unless => :quarter


  scope :for_profile, lambda {|profile|
    where("profile_id = ?", profile.id) if profile
  }

  #  def can_be_destroyed?
  #    true unless self.classroom.empty?
  #  end

  def teacher
    unless self.classroom.nil?
      self.classroom.teacher
    end
  end

  # def create_qualifyingentity_tlresults
  #   self.contentblocks.each do |cb|
  #     self.qualifyingentity_tlresults.build(:percentage => 0, :tlresult_id => cb.tlresult.id) unless tlresult_ids.include?(tlresult.id)
  #     self.save
  #   end
  # end
  
  def set_quarter
    Quarter.all.sort.each do |q|
      self.quarter = (q.start_date..q.end_date).include?(date) ? q : nil
    end
  end
end
