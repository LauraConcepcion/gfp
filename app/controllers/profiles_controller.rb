class ProfilesController < InheritedResources::Base
  before_filter :authenticate_teacher!
  skip_before_filter :check_profiles
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
    @qualifyingentities = resource.qualifyingentities
    @students = resource.classroom ? resource.classroom.students : []
    @students.each do |student|
      @qualifyingentities.each do |qe|
        qe.qualifyingentity_tlresults.each do |qe_tlr|
          score = qe_tlr.scores.where(:student_id => student).first
          Score.create(:qualifyingentity_tlresult_id => qe_tlr.id, :student_id => student.id) unless score
        end
      end
    end
  end

  def update_scores
    update! do |success, failure|
      success.html { redirect_to profiles_path}
      failure.html do
        @qualifyingentities = resource.qualifyingentities
        @students = resource.classroom.students
        render :edit_scores
      end
    end
  end

  private

  def collection
    @q ||= end_of_association_chain.accessible_by(current_ability).search(params[:q])
    @q.sorts = "institute_id asc" if @q.sorts.empty?
    @profiles ||= @q.result(:distintct => true).page(params[:page])
  end
end
