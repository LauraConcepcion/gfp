require 'spec_helper'

describe QualifyingentityTlresult do
  it { should belong_to :qualifyingentity}
  it { should belong_to :tlresult}
  it { should validate_presence_of :percentage }
end
