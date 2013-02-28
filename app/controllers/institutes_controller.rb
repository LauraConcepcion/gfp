class InstitutesController < InheritedResources::Base
  before_filter :authenticate_teacher!  
  respond_to :html, :xml, :json
  before_filter :authenticate_teacher!
end
