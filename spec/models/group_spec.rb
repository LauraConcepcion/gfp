require 'spec_helper'

describe Group do
  it { should have_many :classroom}
  it { should validate_presence_of :group_code }
  it { should validate_presence_of :name }
end
