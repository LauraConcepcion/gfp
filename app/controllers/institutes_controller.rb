class InstitutesController < InheritedResources::Base
  before_filter :authenticate_teacher!

end
