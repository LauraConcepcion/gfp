class ProfilesController < InheritedResources::Base
  before_filter :authenticate_teacher!  
  respond_to :html, :xml, :json
  def new
    debugger
    @profile = Profile.new
    @teacher = current_teacher
  end
  def edit 
    @profile = Profile.find(params[:id])
    @teacher = current_teacher
  end
  def create
    debugger
    @profile = Profile.new(params[:profile])
    @profile.teacher = current_teacher
    if @profile.save
      flash[:notice] = "Succesfully registered"
      redirect_to teacher_profile_path(current_teacher.id,@profile.id)
    else
      render :action => 'new'
    end
  end
  def asign_criterion
    @profile = Profile.find(params[:profile_id])
    @teacher = current_teacher
    if @profile.qualifyingentity_criterions.blank?
      @profile.asign_criterions
    end
  end
end
