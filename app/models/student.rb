class Student < ActiveRecord::Base
  attr_accessible :name, :firstsurname, :secondsurname, :dni, :phone, :student_code, :birthdate, :mail, :record, :score_ids, :classroom_id
  # belongs_to :classroom, :inverse_of => :students
  has_and_belongs_to_many :classrooms

  has_many :scores, :inverse_of => :student
  has_many :points
  has_many :absences
  has_many :incidents
  has_many :observations

  scope :student_list, lambda {|group_id, matter_id, trainercycle_id|
    joins(:classrooms).where('classrooms.group_id = ? and classrooms.matter_id = ? and classrooms.trainercycle_id = ?', group_id, matter_id, trainercycle_id)
  }

  def full_name
    "#{firstsurname} #{secondsurname}, #{name}"
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      student = find_by_id(row["id"]) || new
      student.attributes = row.to_hash.slice(*accessible_attributes)
      student.save!
    end
  end

  def self.open_spreadsheet(file)
    debugger
    case File.extname(file.original_filename)
    when ".csv" then CSV.read(file.path)
    when ".xls" then Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
