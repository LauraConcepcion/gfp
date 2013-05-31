module QualifyingentitiesHelper
  def contentblocks_options(teacher)
    profile = teacher.current_profile
    matter = profile.matter if profile
    matter ? matter.contentblocks : []
  end
end
