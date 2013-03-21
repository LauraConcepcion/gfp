class Qualifyingentity < ActiveRecord::Base
  attr_accessible :name, :classroom_id, :contentblock_ids, :qualifyingentity_criterion_ids, :score_ids
  has_many :score
  #FIXME: queda pendiente determinar las relaciones con los alumnos
  belongs_to :classroom
  #Mediante profile se determina la asignatura para la que se están creando las entidades calificables
  belongs_to :profile
  #FIXME: revisar más adelante
  has_many :qualifyingentity_criterions
  has_many :criterions, :through => :qualifyingentity_criterions
  
  has_and_belongs_to_many :contentblocks

  #accepts_nested_attributes_for :qualifyingentity_criterions, :reject_if => :all_blank, :allow_destroy => true 

#  before_destroy :can_be_destroyed?
  
  scope :for_profile, lambda {|profile|
    where("profile_id = ?", profile.id)
  }

#  def can_be_destroyed?
#    true unless self.classroom.empty?
#  end
  
  def teacher
    unless self.classroom.nil?
      self.classrrom.teacher
    end
  end

  def asign_criterions(profile)
    #TODO se deben filtrar los criterios del perfil en base a los contenidos de la materia
    Criterion.all.each do |criterion|
      self.qualifyingentity_criterions << QualifyingentityCriterion.new(:percentage => 0, :criterion_id => criterion.id, :profile_id => profile.id)
    end
  end
end
