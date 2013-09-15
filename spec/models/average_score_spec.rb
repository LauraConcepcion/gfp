require 'spec_helper'

describe AverageScore do
  it { should belong_to :student }
  it { should belong_to :tlresult }
  it { should belong_to :quarter }
  it { should validate_presence_of :quarter }
  it { should validate_presence_of :student }
  it { should validate_numericality_of :grade } unless :new_record?

  it "should be valid" do
    average_score = FactoryGirl.create(:average_score)
    average_score.should be_valid
  end

  it "should calculate quarter average grades" do
    pr = FactoryGirl.create(:profile)
    cl = FactoryGirl.create(:classroom, :profile => pr)
    q1 = FactoryGirl.create(:quarter)
    q2 = FactoryGirl.create(:quarter)
    q3 = FactoryGirl.create(:quarter)
    tlr1 = FactoryGirl.create(:tlresult, :matter => pr.matter)
    tlr2 = FactoryGirl.create(:tlresult, :matter => pr.matter)
    st1 = FactoryGirl.create(:student)
    st1.classrooms << cl
    st2 = FactoryGirl.create(:student)
    st2.classrooms << cl

    # We need the global percentages
    tlr_perc_tlr1 = FactoryGirl.create(:tlresult_percentage, :tlresult => tlr1, :profile => pr, :quarter_1 => 33, :quarter_2 => 40, :quarter_3 => 27, :global => 50)
    tlr_perc_tlr2 = FactoryGirl.create(:tlresult_percentage, :tlresult => tlr2, :profile => pr, :quarter_1 => 20, :quarter_2 => 40, :quarter_3 => 40, :global => 40)

    av_tlr1_st1_q1 = FactoryGirl.create(:average_score, :profile_id => pr.id, :student => st1, :quarter => q1, :tlresult => tlr1, :grade => 10)
    av_tlr1_st1_q2 = FactoryGirl.create(:average_score, :profile_id => pr.id, :student => st1, :quarter => q2, :tlresult => tlr1, :grade => 4)
    av_tlr1_st1_q3 = FactoryGirl.create(:average_score, :profile_id => pr.id, :student => st1, :quarter => q3, :tlresult => tlr1, :grade => 1)
    av_tlr2_st1_q1 = FactoryGirl.create(:average_score, :profile_id => pr.id, :student => st1, :quarter => q1, :tlresult => tlr2, :grade => 5)
    av_tlr2_st1_q2 = FactoryGirl.create(:average_score, :profile_id => pr.id, :student => st1, :quarter => q2, :tlresult => tlr2, :grade => 10)
    av_tlr2_st1_q3 = FactoryGirl.create(:average_score, :profile_id => pr.id, :student => st1, :quarter => q3, :tlresult => tlr2, :grade => 2)

    av_tlr1_st2_q1 = FactoryGirl.create(:average_score, :profile_id => pr.id, :student => st2, :quarter => q1, :tlresult => tlr1, :grade => 8)
    av_tlr1_st2_q2 = FactoryGirl.create(:average_score, :profile_id => pr.id, :student => st2, :quarter => q2, :tlresult => tlr1, :grade => 3)
    av_tlr1_st2_q3 = FactoryGirl.create(:average_score, :profile_id => pr.id, :student => st2, :quarter => q3, :tlresult => tlr1, :grade => 5)
    av_tlr2_st2_q1 = FactoryGirl.create(:average_score, :profile_id => pr.id, :student => st2, :quarter => q1, :tlresult => tlr2, :grade => 7)
    av_tlr2_st2_q2 = FactoryGirl.create(:average_score, :profile_id => pr.id, :student => st2, :quarter => q2, :tlresult => tlr2, :grade => 10)
    av_tlr2_st2_q3 = FactoryGirl.create(:average_score, :profile_id => pr.id, :student => st2, :quarter => q3, :tlresult => tlr2, :grade => 7)

    assert_equal ((10*0.33+5*0.20)/(0.33+0.20)).round(2), AverageScore.where(:profile_id => pr.id, :student_id => st1.id, :quarter_id => q1.id, :tlresult_id => nil, :teacher_revised => false).first.grade.round(2)
    assert_equal ((4*0.40+10*0.40)/(0.40+0.40)).round(2), AverageScore.where(:profile_id => pr.id, :student_id => st1.id, :quarter_id => q2.id, :tlresult_id => nil, :teacher_revised => false).first.grade.round(2)
    assert_equal ((1*0.27+2*0.40)/(0.27+0.40)).round(2),  AverageScore.where(:profile_id => pr.id, :student_id => st1.id, :quarter_id => q3.id, :tlresult_id => nil, :teacher_revised => false).first.grade.round(2)
    # TODO y la total?.round(2)

    assert_equal ((8*0.33+7*0.20)/(0.33+0.20)).round(2),  AverageScore.where(:profile_id => pr.id, :student_id => st2.id, :quarter_id => q1.id, :tlresult_id => nil, :teacher_revised => false).first.grade.round(2)
    assert_equal ((3*0.40+10*0.40)/(0.40+0.40)).round(2), AverageScore.where(:profile_id => pr.id, :student_id => st2.id, :quarter_id => q2.id, :tlresult_id => nil, :teacher_revised => false).first.grade.round(2)
    assert_equal ((5*0.27+7*0.40)/(0.27+0.40)).round(2),  AverageScore.where(:profile_id => pr.id, :student_id => st2.id, :quarter_id => q3.id, :tlresult_id => nil, :teacher_revised => false).first.grade.round(2)
    # TODO y la total?
  end

end
