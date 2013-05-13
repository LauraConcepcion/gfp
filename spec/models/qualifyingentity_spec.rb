require 'spec_helper'

describe Qualifyingentity do
  it { should belong_to :profile}
  it { should belong_to :classroom}
  it { should have_and_belong_to_many :contentblocks }
  it { should have_many :socre}
  it { should have_many :qualifyingentity_criterions}
  it { should have_many :criterions}
  it { should validate_presence_of :name }
  
  before(:each) do  
    @attr = { :name => "Example Qualifyingentity" }
    @teachattr = { :name => "Profesor" }
  end 


  it "should create a new instance given valid attributes" do
    @qualifyingentity = Qualifyingentity.create!(@attr)
  end

  it "should find by profile"
    @qualifyingentity = Qualifyingentity.create!(@attr)
    @teacher = Teacher.create!(@teachattr)
    @profile = Profile.create!() 
  end
end
