require 'spec_helper'

describe Qualifyingentity do
  it { should belong_to :profile}
  it { should belong_to :classroom}
  it { should have_and_belong_to_many :contentblocks }
  it { should have_many :score}
  it { should have_many :qualifyingentity_criterions}
  it { should have_many :criterions}
  it { should validate_presence_of :name }
  
  before(:each) do  
    @attr = { :name => "Example Qualifyingentity" }
  end 


  it "should create a new instance given valid attributes" do
    @qualifyingentity = Qualifyingentity.create!(@attr)
  end

  it "should find by profile" do
    qualifyingentity = Qualifyingentity.create!(@attr)
    teacher = Teacher.create!(:email=>'profesor1@prueba.es',:password =>'profesor1')
    institute =  Institute.create(:name=>'Instituto1',:institute_code =>'Instituto1')
    trainercycle = Trainercycle.create(:name=>'Ciclo Formativo1')
    matter = Matter.create(:name=>'Materia1')
    group = Group.create(:name=>'Grupo1', :group_code => 'grupo1')
    profile = Profile.create(:institute_id => institute.id, :teacher_id => teacher.id,:matter_id => matter.id, :group_id => group.id, :trainercycle_id => trainercycle.id)
    
    Qualifyingentity.for_profile(profile)
  end
end
