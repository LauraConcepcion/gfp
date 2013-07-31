module ProfilesHelper
  def qe_title(qualifyingentity)
    title = qualifyingentity.name
    # title += " (#{I18n.l(qualifyingentity.date, :format => :default)})" if qualifyingentity.date
    title
  end
end
