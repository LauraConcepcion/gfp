class QualifyingentityTlresultsController < InheritedResources::Base
  before_filter :authenticate_teacher!  
  respond_to :html, :xml, :json

  private
  def collection
    @q ||= QualifyingentityTlresult.accessible_by(current_ability).search(params[:q])
    @q.sorts = "id asc" if @q.sorts.empty?
    @qualifyingentitiytlresults||= @q.result(:distintct => true).page(params[:page])
  end
end
