class ClassroomsController < InheritedResources::Base
  before_filter :authenticate_teacher!
  load_and_authorize_resource

  require 'csv'

  def create
    create! { classrooms_path }
  end

  def update
    update! { classrooms_path }
  end

  def csv_import
    file_data = params[:file].read
    csv_rows  = CSV.parse(file_data, {:col_sep => ';'})
    n = 0
    e = nil
    csv_rows.each do |row|
      # name,firstsurname,secondsurname, dni, phone, code
      if row[3].blank?
        n += 1
        e = "Se ha ignorado "+"#{n}"+" alumno por no contener dni"
      else
        student = resource.students.find_by_dni(row[3])
        if !student.nil?
          student.name = row[0]
          student.firstsurname = row[1]
          student.secondsurname = row[2]
          student.phone = row[4]
          student.student_code = row[5]
          student.save
        else
          new_student = Student.create(:name => row[0], :firstsurname => row[1], :secondsurname => row[2], :dni => row[3], :phone => row[4], :student_code => row[5])
          resource.students << new_student
          resource.save
        end
      end
    end
    respond_to do |format|
      format.html { redirect_to edit_classrooms_path, :notice => "Successfully imported the CSV file. #{e}" }
    end
  end

  private

  def collection
    @q ||= end_of_association_chain.accessible_by(current_ability).search(params[:q])
    @q.sorts = "name asc" if @q.sorts.empty?
    @classrooms = @q.result(:distinct => true).page(params[:page])
  end
end
