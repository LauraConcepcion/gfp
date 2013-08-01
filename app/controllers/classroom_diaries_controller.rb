class ClassroomDiariesController < InheritedResources::Base
  before_filter :authenticate_teacher!
  respond_to :html, :xml, :json, :js
  belongs_to :profile

  def new
    @classroom_diary = ClassroomDiary.new
    get_profile_data
  end

  def edit
    @classroom_diary = ClassroomDiary.find(params[:id])
    get_profile_data
  end

  def create
    create!
  end

  def update
    update! do |success, failure|
      success.js { redirect_to profile_classroom_diaries_path(parent) }
      failure.js do
        get_profile_data
        render :new
      end
    end
  end

  private

  def collection
    @q ||= end_of_association_chain.accessible_by(current_ability).for_profile(parent).search(params[:q])
    @q.sorts = "created_at desc" if @q.sorts.empty?
    @classroom_diaries = @q.result(:distinct => true).page(params[:page])
  end

  # El problema es que la asignación de profile al resource peta si no se inicializa antes y en el before_filter no lo está
  def get_profile_data
    @current_profile = current_teacher.current_profile if current_teacher
    unless @current_profile
      # Por si no existen profiles dados de alta
      flash[:error] = t(:no_current_profile)
      redirect_to :root_path
      return
    end
    @classroom_diary.profile ||= @current_profile
  end

end
