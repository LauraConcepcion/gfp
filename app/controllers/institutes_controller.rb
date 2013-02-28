class InstitutesController < InheritedResources::Base
  respond_to :html, :xml, :json
  before_filter :authenticate_teacher!
end
