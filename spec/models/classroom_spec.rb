require 'spec_helper'

describe Classroom do
  it { should belong_to :trainercycle}
  it { should belong_to :teacher}
  it { should belong_to :student}
  it { should belong_to :group}
  it { should belong_to :matter}
  it { should belong_to :trainercycle}
  it { should have_many :qualifyingentities}
  it { should have_many :objetive_averages}
  it { should have_many :schedule}
  it { should validate_presence_of :codename }
  it { should validate_presence_of :name }

end
