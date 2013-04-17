class TrainercyclesController < InheritedResources::Base
  before_filter :authenticate_teacher!  
  respond_to :html, :xml, :json, :js
  def update_matter
    trainercycles = Institute.find(params[:id]).trainercycles
    respond_to do |format|
      format.json { render :json => trainercycles.map {|trainercycle| [trainercycle.name, trainercycle.id] }.to_json }
    end
  end

  private
  def collection    
    #@q ||= Criterion.accessible_by(current_ability).search(params[:q])
    @q ||= end_of_association_chain
    @trainercycles ||= @q.page(params[:page]).per(20)

    #@q.sorts = "name asc" if @q.sorts.empty?
    #@criterions ||= @q.result(:distintct => true).page(params[:page])
  end
end