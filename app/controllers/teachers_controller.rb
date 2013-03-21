class TeachersController < InheritedResources::Base
  before_filter :authenticate_teacher!
  respond_to :html, :xml, :json

  def change_current_profile
    profile = Profile.find(params[:profile])
    @teacher = current_teacher
    if @teacher.change_current_profile(profile)
      flash[:notice] = t(:saved)
      redirect_to root_path
    end
  end
end
