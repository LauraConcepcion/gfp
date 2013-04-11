class InstitutesController < InheritedResources::Base
before_filter :authenticate_teacher!  
respond_to :html, :xml, :json, :js

  def update_trainercycle
    trainercycles = Institute.find(params[:id]).trainercycles
    respond_to do |format|
      format.json { render :json => trainercycles.map {|trainercycle| [trainercycle.name, trainercycle.id] }.to_json }
    end
  end
end
