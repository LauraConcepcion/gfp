class Profile < ActiveRecord::Base
  attr_accessible :institute_id, :trainercycle_id, :matter_id, :criterion_ids, :qualifyingentity_ids, :qualifyingentity_tlresult_ids, :qualifyingentity_tlresults_attributes, :group_id, :qualifyingentities_attributes, :qualifyingentity_tlresults_attributes
  belongs_to :institute
  belongs_to :trainercycle
  belongs_to :matter
  belongs_to :teacher
  belongs_to :group
  has_many :qualifyingentity_tlresults, :through => :qualifyingentities
  has_many :qualifyingentities, :dependent => :destroy

#  has_many :tlresults, :through => :qualifyingentity_tlresults
  accepts_nested_attributes_for :qualifyingentity_tlresults, :qualifyingentities,  :reject_if => :all_blank, :allow_destroy => true

  def asign_tlresults
    # Para todos los exámenes del perfil
    self.qualifyingentities.each do |qe|
      # Buscamos todos los contenidos bloques de una entidad calificable y nos traemos su único tlresult (relación 1 a 1 entre contenido bloque y tlresult)
      qe.contentblocks.each do |cb|
        qe.qualifyingentity_tlresults << QualifyingentityTlresult.new(:percentage => 0, :tlresult_id => cb.tlresult.id)
      end
    end
  end

  def name
    "#{self.matter.name} - #{self.institute.institute_code} - #{self.trainercycle.name} - #{self.group.name}"
  end
end
