class ProfilesController < InheritedResources::Base
  before_filter :authenticate_teacher!
  load_and_authorize_resource
  
  respond_to :html, :xml, :json

  def asign_tlresult
    @profile = Profile.find(params[:id])
    @tlresults = @profile.tlresults.uniq
    #if @profile.qualifyingentity_tlresults.blank?
    #  @profile.asign_tlresults
    #end
  end

  private
  def collecton
    @q ||= Profile.accessible_by(current_ability).search(params[:q])
    @q.sorts = "institute_id asc" if @q.sorts.empty?
    @qualifyingentities||= @q.result(:distintct => true).page(params[:page])
  end
end
