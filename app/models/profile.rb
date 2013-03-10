class Profile < ActiveRecord::Base
  attr_accessible :institute_id, :trainercycle_id, :matter_id, :criterion_ids, :qualifyingentity_ids, :qualifyingentity_criterion_ids, :qualifyingentity_criterions_attributes
  belongs_to :institute
  belongs_to :trainercycle
  belongs_to :matter
  belongs_to :teacher
  has_many :qualifyingentity_criterions
  has_many :qualifyingentities, :through => :qualifyingentity_criterions
  has_many :criterions, :through => :qualifyingentity_criterions
  accepts_nested_attributes_for :qualifyingentity_criterions, :qualifyingentities, :criterions, :reject_if => :all_blank, :allow_destroy => true

  def asign_criterions
    #TODO se deben filtrar los criterios del perfil en base a los contenidos de la materia
    Criterion.all.each do |criterion|
      Qualifyingentity.all.each do |qc|
        self.qualifyingentity_criterions << QualifyingentityCriterion.new(:percentage => 0, :criterion_id => criterion.id, :qualifyingentity_id => qc.id)
      end
    end
  end
end
