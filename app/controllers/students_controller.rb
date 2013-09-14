class StudentsController < InheritedResources::Base
  before_filter :authenticate_teacher!
  respond_to :html, :xml, :json, :js
  load_and_authorize_resource

  belongs_to :classroom, :optional => true
  belongs_to :profile, :optional => true

  def create
    create! { students_path }
  end

  def update
    update! { students_path }
  end

  def import
    imported, updated, errors = Student.import(params[:file], current_teacher)
    case errors
      when 0
        flash[:notice]= I18n.t(:all_students_added, :scope => 'flash.general', :imported => imported, :updated => updated)
        redirect_to students_path
      when 1
        flash[:alert]=I18n.t(:no_file, :scope => 'flash.general')
        redirect_to students_path
      when 2
        flash[:alert]=I18n.t(:fields_blanks, :scope => 'flash.general')
        flash[:notice]= I18n.t(:students_added, :scope => 'flash.general', :imported => imported, :updated => updated) if imported && imported > 0 || updated && updated > 0
        redirect_to students_path
      when 3
        flash[:alert]=I18n.t(:classroom_code_import_fail, :scope => 'flash.general')
        flash[:notice]= I18n.t(:students_added, :scope => 'flash.general', :imported => imported, :updated => updated) if imported && imported > 0 || updated && updated > 0
        redirect_to students_path
    end
  end

  def search_by_dni
    student = Student.where('teacher_id = ?', current_teacher).find_by_dni(params["dni"])
    render :json => student.to_json
  end

  private

  def collection
    @q ||= end_of_association_chain.accessible_by(current_ability).search(params[:q])

    @q.sorts = "firstsurname asc, secondsurname asc, name asc" if @q.sorts.empty?
    @students = @q.result(:distinct => true).page(params[:page])
  end
end
