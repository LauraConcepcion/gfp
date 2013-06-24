class QualifyingentitiesController < InheritedResources::Base
  before_filter :authenticate_teacher!

  respond_to :html, :xml, :json

  def new
    @qualifyingentity = Qualifyingentity.new
    get_profile_data
  end

  def create
    create! do |success, failure|
      failure.html do
        get_profile_data
        render :new
      end
    end
  end

  def edit
    @qualifyingentity = Qualifyingentity.find(params[:id])
    get_profile_data
  end

  def update
    update! do |success, failure|
      failure.html do
        get_profile_data
        render :new
      end
    end
  end

  private

  def collection
    @q ||= Qualifyingentity.accessible_by(current_ability).for_profile(current_teacher.current_profile).search(params[:q])
    @q.sorts = "name asc" if @q.sorts.empty?
    @qualifyingentities||= @q.result(:distintct => true).page(params[:page])
  end

  # TODO La parte de current_profile igual va mejor en application_controller
  # El problema es que la asignación de profile al resource peta si no se inicializa antes y en el before_filter no lo está
  def get_profile_data
    @current_profile = current_teacher.current_profile if current_teacher
    unless @current_profile
      # Por si no existen profiles dados de alta
      flash[:error] = t(:no_current_profile)
      redirect_to :root_path
      return
    end
    @qualifyingentity.profile ||= @current_profile
    @matter = @current_profile.matter
    @tlresults = @matter.tlresults if @matter
  end
end
