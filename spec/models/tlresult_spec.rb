require 'spec_helper'

describe Tlresult do
  it { should have_many :qualifyingentity_tlresults}
  it { should have_many :criterions}
  it { should validate_presence_of :name }
end
