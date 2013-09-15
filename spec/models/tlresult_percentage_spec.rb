require 'spec_helper'

describe TlresultPercentage do
  it { should belong_to :profile }
  it { should belong_to :tlresult }
  it { should validate_presence_of :profile }
  it { should validate_presence_of :tlresult }
  it { should validate_numericality_of :quarter_1 }
  it { should validate_numericality_of :quarter_2 }
  it { should validate_numericality_of :quarter_3 }
  it { should validate_numericality_of :global }

  it "should be valid" do
    tlresult_percentage = FactoryGirl.create(:tlresult_percentage)
    tlresult_percentage.should be_valid
  end
end
