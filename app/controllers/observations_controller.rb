class ObservationsController < InheritedResources::Base
  before_filter :authenticate_teacher!

  nested_belongs_to :profile, :student

  respond_to :html, :xml, :json, :js

  private

  def collection
    @q ||= end_of_association_chain.accessible_by(current_ability).for_profile_and_student(@profile, @student).search(params[:q])
    @q.sorts = "point_datetime asc" if @q.sorts.empty?
    @points ||= @q.result(:distinct => true).page(params[:page])
  end
end
