# encoding: UTF-8
class Student < ActiveRecord::Base

  acts_as_paranoid

  attr_accessible :name, :firstsurname, :secondsurname, :dni, :phone, :student_code, :birthdate, :mail, :record, :score_ids, :classroom_ids, :teacher, :teacher_id
  # belongs_to :classroom, :inverse_of => :students
  has_and_belongs_to_many :classrooms
  belongs_to :teacher

  has_many :scores, :inverse_of => :student
  has_many :average_scores, :inverse_of => :student
  has_many :points
  has_many :absences
  has_many :incidents
  has_many :observations
  validates_presence_of :name, :dni, :teacher_id

  scope :student_list, lambda {|group_id, matter_id, trainercycle_id|
    joins(:classrooms).where('classrooms.group_id = ? and classrooms.matter_id = ? and classrooms.trainercycle_id = ?', group_id, matter_id, trainercycle_id)
  }

  scope :for_profiles, lambda {|profile_ids|
    joins(:classrooms).where('profile_id in (?)', profile_ids)
  }

  scope :for_teacher, lambda {|teacher_id| where(:teacher_id => teacher_id)}

  def full_name
    "#{firstsurname} #{secondsurname}, #{name}"
  end


  def dni_name
    "#{self.dni}, #{self.firstsurname} #{self.secondsurname}, #{self.name}"
  end

  # def self.import(file)
  #   spreadsheet = open_spreadsheet(file)
  #   header = spreadsheet.row(1)
  #   (2..spreadsheet.last_row).each do |i|
  #     row = Hash[[header, spreadsheet.row(i)].transpose]
  #     student = find_by_id(row["id"]) || new
  #     student.attributes = row.to_hash.slice(*accessible_attributes)
  #     student.save!
  #   end
  # end

  # def self.open_spreadsheet(file)
  #   case File.extname(file.original_filename)
  #   when ".csv" then CSV.read(file.path)
  #   when ".xls" then Excel.new(file.path, nil, :ignore)
  #   when ".xlsx" then Excelx.new(file.path, nil, :ignore)
  #   else raise "Unknown file type: #{file.original_filename}"
  #   end
  # end

  def self.import(file, teacher)
    errors = 0
    imported = nil
    updated = nil
    imported = 0
    updated = 0

    if file.blank?
      errors = 1
    elsif file.kind_of?(String)
      str = file
      col_sep = "\t"
    elsif file.kind_of?(File)
      str = File.open(file.path).read
      # Quitamos el BOM de utf8 que mete el win7
      str.sub!(/^\xEF\xBB\xBF/, '')
      col_sep = ","
    end

    str && CSV.parse(str, headers: true, :col_sep => col_sep) do |row|
      if row["clase"].blank? || row["dni"].blank?
        errors = 2
      else
        student = Student.find_by_dni_and_teacher(row["dni"], teacher) || new
        student.teacher = teacher if student.teacher.blank?
        student.attributes = row.to_hash.slice(*accessible_attributes)
        clase = teacher.classrooms.detect {|classroom| classroom.code_import == row["clase"].to_s}
        if clase
          if !student.classrooms.include?(clase)
            student.classrooms << clase
          end
        else
          errors = 3
        end
        new_record = student.new_record?
        if student.save
          imported += 1 if new_record
          updated += 1 if !new_record
        end
      end
    end
    [imported, updated, errors]
  end
  
  def self.find_by_dni_and_teacher(dni,teacher)
    student = Student.for_profiles(teacher.profiles).find_by_dni(dni, :readonly => false)
    student
  end

end
