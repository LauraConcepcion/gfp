class Profile < ActiveRecord::Base
  attr_accessible :institute_id, :trainercycle_id, :matter_id, :criterion_ids, :qualifyingentity_ids, :qualifyingentity_tlresult_ids, :qualifyingentity_tlresults_attributes, :group_id
  belongs_to :institute
  belongs_to :trainercycle
  belongs_to :matter
  belongs_to :teacher
  belongs_to :group
  has_many :qualifyingentity_tlresults
  has_many :qualifyingentities, :through => :qualifyingentity_tlresults
  has_many :tlresults, :through => :qualifyingentity_tlresults
  accepts_nested_attributes_for :qualifyingentity_tlresults, :qualifyingentities, :tlresults, :reject_if => :all_blank, :allow_destroy => true

  def asign_tlresults
    #TODO se deben filtrar los criterios del perfil en base a los contenidos de la materia
    Tlresult.all.each do |tl|
      Qualifyingentity.all.each do |qc|
        self.qualifyingentity_tlresults << QualifyingentityTlresult.new(:percentage => 0, :tlresult_id => tl.id, :qualifyingentity_id => qc.id)
      end
    end
  end

  def name
    "#{self.matter.name} - #{self.institute.code} - #{self.trainercycle.name} - #{self.group.name}"
  end
end
