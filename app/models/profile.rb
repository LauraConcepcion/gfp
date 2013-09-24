class Profile < ActiveRecord::Base
  acts_as_paranoid
  attr_accessible :institute_id ,:teacher_id, :trainercycle_id, :matter_id, :group_id, :qualifyingentities_attributes, :qualifyingentity_tlresults_attributes, :own_tlresults_attributes, :tlresult_percentages_attributes
  belongs_to :institute
  belongs_to :trainercycle
  belongs_to :matter
  belongs_to :teacher
  belongs_to :group
  
  has_one :classroom

  has_many :qualifyingentities, :order => 'date ASC'
  has_many :qualifyingentity_tlresults, :through => :qualifyingentities, :order => 'qualifyingentities.date ASC, tlresults.name ASC'
  has_many :tlresults, :through => :qualifyingentity_tlresults, :order => 'name ASC'
  has_many :tlresult_percentages
  has_many :own_tlresults, :class_name => Tlresult
  has_many :scores, :through => :qualifyingentity_tlresults
  has_many :average_scores
  has_many :points
  has_many :absences
  has_many :incidents
  has_many :observations

  has_many :students, :through => :classroom
  
  has_many :classroom_diaries

  validates :teacher_id, :presence => true
  validates :institute_id, :presence => true
  validates :trainercycle_id, :presence => true
  validates :matter_id, :presence => true
  validates :group_id, :presence => true

  validates_associated :qualifyingentities
  validates_associated :qualifyingentity_tlresults

  accepts_nested_attributes_for :qualifyingentities, :reject_if => :all_blank #, :allow_destroy => true
  # NOTE La edición de poneraciones está hecha mediante el has_many through
  accepts_nested_attributes_for :qualifyingentity_tlresults, :reject_if => :all_blank #, :allow_destroy => true
  accepts_nested_attributes_for :own_tlresults, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :tlresult_percentages, :reject_if => :all_blank

  scope :active, lambda {|teacher_id|
    where(:default => true, :teacher_id => teacher_id) unless teacher_id.nil?
  }

  # FIXME sobra?
  # def assign_tlresults
  #   # Para todos los exámenes del perfil
  #   self.qualifyingentities.each do |qe|
  #     # Buscamos todos los contenidos bloques de una entidad calificable y nos traemos su único tlresult (relación 1 a 1 entre contenido bloque y tlresult)
  #     qe.contentblocks.each do |cb|
  #       qe.qualifyingentity_tlresults << QualifyingentityTlresult.new(:percentage => 0, :tlresult_id => cb.tlresult.id)
  #     end
  #   end
  # end

  def name
    "#{self.matter.try(:name)} - #{self.institute.try(:institute_code)} - #{self.trainercycle.try(:title)} - #{self.group.try(:name)}"
  end

  # FIXME sobra?
  # def tlresults
  #   tlresults = []
  #   self.qualifyingentity_tlresults.each do |qt|
  #     tlresults << qt.tlresult 
  #   end
  #   tlresults.uniq!
  # end
end
