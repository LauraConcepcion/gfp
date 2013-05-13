require 'spec_helper'

describe Quarter do
  it { should have_many :contentblocks}
  it { should validate_presence_of :name }
end
