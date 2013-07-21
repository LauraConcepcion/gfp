class InstitutesController < InheritedResources::Base
  before_filter :authenticate_teacher!
  respond_to :html, :json, :js
  skip_before_filter :check_profiles

  def search
    @institutes = Institute.search(:name_cont => params[:term]).result(:distinct => true)
    respond_to do |format|
      format.json {
        render :json => @institutes.to_json
      }
    end
  end

  private

  def collection
    @q ||= end_of_association_chain.accessible_by(current_ability).search(params[:q])
    @q.sorts = "name asc" if @q.sorts.empty?
    @profiles ||= @q.result(:distinct => true).page(params[:page])
  end
end
