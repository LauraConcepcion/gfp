class ProfilesController < InheritedResources::Base
  before_filter :authenticate_teacher!
  load_and_authorize_resource
#  belongs_to :teacher
  respond_to :html, :xml, :json

  # def create
  #   debugger
  #   @profile = Profile.new(params[:profile])
  #   if @profile.save
  #     flash[:notice] = "Succesfully registered"
  #     redirect_to teacher_profile_path(current_teacher.id,@profile.id)
  #   else
  #     render :action => 'new'
  #   end
  # end

  def asign_tlresult
    @profile = Profile.find(params[:id])
    @tlresults = @profile.tlresults.uniq
    #if @profile.qualifyingentity_tlresults.blank?
    #  @profile.asign_tlresults
    #end
  end
end
