class ProfilesController < InheritedResources::Base
  before_filter :authenticate_teacher!
  load_and_authorize_resource

  respond_to :html, :xml, :json

  def update_tlresults
    update! do |success, failure|
      failure.html do
        render :edit_tlresults
      end
    end
  end

  private

  def collection
    @q ||= Profile.accessible_by(current_ability).search(params[:q])
    @q.sorts = "institute_id asc" if @q.sorts.empty?
    @qualifyingentities||= @q.result(:distintct => true).page(params[:page])
  end
end
