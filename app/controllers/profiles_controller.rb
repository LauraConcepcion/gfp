class ProfilesController < InheritedResources::Base
  before_filter :authenticate_teacher!  
  respond_to :html, :xml, :json
  def new
    @profile = Profile.new
    @teacher = current_teacher
  end
  def create
  end
end
