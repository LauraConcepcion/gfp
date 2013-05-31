class QualifyingentitiesController < InheritedResources::Base
  before_filter :authenticate_teacher!  
  respond_to :html, :xml, :json
  def create
    @qualifyingentity = Qualifyingentity.new(params[:qualifyingentity])
    @qualifyingentity.profile = current_teacher.current_profile
    create!
  end
  def put_scores
    @students = Student.student_list(current_teacher.current_profile.group_id,current_teacher.current_profile.matter_id,current_teacher.current_profile.trainercycle_id)
    @qualifyingentity = Qualifyingentity.find(params[:qualifyingentity_id])
    debugger
    @scores = @students.map do |student|
      @qualifyingentity.scores.build(:student_id => student.id)
    end
    #@qualifyingentity.scores = @scores
    #@qualifyingentity.students = @students
    debugger
  end
  private
  def collection
    @q ||= Qualifyingentity.accessible_by(current_ability).for_profile(current_teacher.current_profile).search(params[:q])
    @q.sorts = "name asc" if @q.sorts.empty?
    @qualifyingentities||= @q.result(:distintct => true).page(params[:page])
  end
end
