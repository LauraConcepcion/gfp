require 'spec_helper'

describe ObjetiveAverage do
  it { should belong_to :objetive}
  it { should belong_to :classroom}
  it { should validate_presence_of :name }
end
