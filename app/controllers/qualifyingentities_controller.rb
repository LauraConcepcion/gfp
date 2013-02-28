class QualifyingentitiesController < InheritedResources::Base
  before_filter :authenticate_teacher!  
  respond_to :html, :xml, :json
end
