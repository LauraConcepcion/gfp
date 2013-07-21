class CriterionsController < InheritedResources::Base
  before_filter :authenticate_teacher!
  respond_to :html, :xml, :json, :js
end
