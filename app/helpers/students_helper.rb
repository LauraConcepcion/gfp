module StudentsHelper
  def classroom_name_and_profile(classroom)
    return t(:no_classroom) unless classroom

    raw((classroom.name || t(:no_name)) + " / " + (classroom.profile ? (classroom.profile.name || t(:name)) : t(:no_profile_for_classroom)))
  end
end
