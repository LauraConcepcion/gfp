class StudentsController < InheritedResources::Base
  before_filter :authenticate_teacher!
  respond_to :html, :xml, :json, :js
  load_and_authorize_resource

  belongs_to :classroom, :optional => true

  def create
    create! { classroom_students_path(parent) }
  end

  def update
    update! { classroom_students_path(parent) }
  end

  private

  def collection
    @q ||= end_of_association_chain.accessible_by(current_ability).search(params[:q])
    @q.sorts = "firstsurname asc, secondsurname asc, name asc" if @q.sorts.empty?
    @students = @q.result(:distinct => true).page(params[:page])
  end
end
