class ProfilesController < InheritedResources::Base
  before_filter :authenticate_teacher!
  respond_to :html, :xml, :json

  #skip_before_filter :check_profiles
  load_and_authorize_resource

  before_filter :set_quarter, :only => [:edit_scores, :update_scores, :edit_tlresults, :update_tlresults]

  def create
    create! { profiles_path }
  end

  def update
    update! { profiles_path }
  end

  def edit_tlresults
    @unique_tlrs = Tlresult.unique_for_profile_and_quarter(resource, @quarter)
  end

  def update_tlresults
    update! do |success, failure|
      success.html { redirect_to profile_qualifyingentities_path(resource) }
      failure.html do
        render :edit_tlresults
      end
    end
  end

  def edit_tlresult_percentages
    @quarters = Quarter.for_this_year
    @unique_tlrs = Tlresult.unique_for_profile(resource)
    @unique_tlrs.each do |tlr|
      tlr_perc = resource.tlresult_percentages.where(:tlresult_id => tlr.id).first
      resource.tlresult_percentages.build(:tlresult_id => tlr.id) unless tlr_perc
    end
  end

  def update_tlresult_percentages
    update! do |success, failure|
      success.html { redirect_to profile_qualifyingentities_path(resource) }
      failure.html do
        render :edit_tlresult_percentages
      end
    end
  end

  def edit_scores
    @qualifyingentities = resource.qualifyingentities.where(:quarter_id => @quarter.try(:id) || @quarters.map(&:id)).order(:created_at, :date)
    @qualifyingentity_tlresults = @qualifyingentities.map(&:qualifyingentity_tlresults).flatten
    @unique_tlrs = @qualifyingentity_tlresults.map(&:tlresult).uniq
    @students = resource.classroom ? resource.classroom.students : []
    @students.each do |student|
      @qualifyingentities.each do |qe|
        qe.qualifyingentity_tlresults.each do |qe_tlr|
          score = qe_tlr.scores.find_by_student_id(student.id)
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
    @q.sorts = "institute_id" if @q.sorts.empty?
    @profiles = @q.result(:distinct => true).page(params[:page])
  end

  def set_quarter
    @quarters = Quarter.for_this_year
    if params[:quarter_id]
      @quarter = Quarter.find(params[:quarter_id])
      session[:quarter] = @quarter
    elsif session[:quarter]
      @quarter = session[:quarter]
    else
      @quarter = Quarter.for_today
      session[:quarter] = @quarter
    end
  end
end
