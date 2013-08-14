require 'spec_helper'

describe Score do
  it { should belong_to :qualifyingentity_tlresult }
  it { should belong_to :student }
  it { should validate_numericality_of :grade } unless :new_record?

  before(:each) do
    @score = FactoryGirl.create(:score)
  end

  it "should be valid" do
    @score.should be_valid
  end

end
