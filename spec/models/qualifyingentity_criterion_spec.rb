require 'spec_helper'

describe QualifyingentityCriterion do
  it { should belong_to :criterion}
  it { should belong_to :qualifyingentity}
  it { should belong_to :profile}
  it { should validate_presence_of :percentage }

end
