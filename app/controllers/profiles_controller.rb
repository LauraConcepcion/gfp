class ProfilesController < InheritedResources::Base
  debugger
  before_filter :authenticate_teacher!  
  respond_to :html, :xml, :json
end
