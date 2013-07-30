class AbsencesController < InheritedResources::Base
  before_filter :authenticate_teacher!

  nested_belongs_to :profile, :student

  respond_to :html, :xml, :json, :js

  private

  def collection
    @q ||= end_of_association_chain.accessible_by(current_ability).for_profile_and_student(@profile, @student).search(params[:q])
    @q.sorts = "absence_datetime asc" if @q.sorts.empty?
    @absences ||= @q.result(:distinct => true).page(params[:page])
  end
end
