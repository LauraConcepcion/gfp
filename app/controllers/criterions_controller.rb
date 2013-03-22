class CriterionsController < InheritedResources::Base
  before_filter :authenticate_teacher!  
  respond_to :html, :xml, :json
  
  private
  def collection    
    @q ||= Criterion.accessible_by(current_ability).search(params[:q])
    @q.sorts = "name asc" if @q.sorts.empty?
    @criterions ||= @q.result(:distintct => true).page(params[:page])
  end

end