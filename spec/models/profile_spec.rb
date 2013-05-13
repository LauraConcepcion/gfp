# encoding: utf-8
require 'spec_helper'

describe Profile do
  it { should belong_to :institute}
  it { should belong_to :trainercycle}
  it { should belong_to :matter}
  it { should belong_to :teacher}
  it { should belong_to :group}
  it { should have_many :qualifyingentity_tlresults}
  it { should have_many :qualifyingentities}
end
