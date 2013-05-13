require 'spec_helper'

describe Objetive do
  it { should have_many :objetive_averages}
  it { should validate_presence_of :name }

end
