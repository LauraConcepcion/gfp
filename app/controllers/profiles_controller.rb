class ProfilesController < InheritedResources::Base
  before_filter :authenticate_teacher!
  load_and_authorize_resource

  respond_to :html, :xml, :json

  def update_tlresults
    update! do |success, failure|
      failure.html do
        render :edit_tlresults
      end
    end
  end

  def edit_scores
    students = resource.classroom.students
    qualifyingentities = resource.qualifyingentities
    students.each do |student|
      qualifyingentities.each do |qualifyingentity|
        score = resource.scores.where(:qualifyingentity_id => qualifyingentity.id, :student_id => student.id).first
        # Creamos el score vacío si no existiera para ese alumno y entidad calificable
        # TODO No se puede si no guardamos antes (el fields_for para habtm no funciona)
        score = resource.scores.build(:qualifyingentity_id => qualifyingentity.id, :student_id => student.id) unless score
        score.save :validate => false
      end
    end
  end

  def update_scores
    update! do |success, failure|
      failure.html do
        render :edit_scores
      end
    end
  end

  private

  def collection
    @q ||= Profile.accessible_by(current_ability).search(params[:q])
    @q.sorts = "institute_id asc" if @q.sorts.empty?
    @qualifyingentities||= @q.result(:distintct => true).page(params[:page])
  end
end
