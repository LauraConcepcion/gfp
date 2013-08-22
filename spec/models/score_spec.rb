require 'spec_helper'

describe Score do
  it { should belong_to :qualifyingentity_tlresult }
  it { should belong_to :student }
  it { should validate_numericality_of :grade } unless :new_record?

  it "should be valid" do
    score = FactoryGirl.create(:score)
    score.should be_valid
  end

  it "should calculate average grades" do
    q = FactoryGirl.create(:quarter)
    tlr1 = FactoryGirl.create(:tlresult)
    tlr2 = FactoryGirl.create(:tlresult)
    tlr3 = FactoryGirl.create(:tlresult)
    student1 = FactoryGirl.create(:student)
    student2 = FactoryGirl.create(:student)
    student3 = FactoryGirl.create(:student)

    qe1 = FactoryGirl.create(:qualifyingentity, :quarter => q)
    qe1_tlr1 = FactoryGirl.create(:qualifyingentity_tlresult, :qualifyingentity => qe1, :tlresult => tlr1, :percentage => 20)
    qe1_tlr2 = FactoryGirl.create(:qualifyingentity_tlresult, :qualifyingentity => qe1, :tlresult => tlr2, :percentage => 50)
    qe2 = FactoryGirl.create(:qualifyingentity, :quarter => q)
    qe2_tlr1 = FactoryGirl.create(:qualifyingentity_tlresult, :qualifyingentity => qe2, :tlresult => tlr1, :percentage => 80)
    qe2_tlr3 = FactoryGirl.create(:qualifyingentity_tlresult, :qualifyingentity => qe2, :tlresult => tlr3, :percentage => 70)
    qe3 = FactoryGirl.create(:qualifyingentity, :quarter => q)
    qe3_tlr2 = FactoryGirl.create(:qualifyingentity_tlresult, :qualifyingentity => qe3, :tlresult => tlr2, :percentage => 50)
    qe3_tlr3 = FactoryGirl.create(:qualifyingentity_tlresult, :qualifyingentity => qe3, :tlresult => tlr3, :percentage => 30)

    score_qe1_tlr1_st1 = FactoryGirl.create(:score, :grade => 10, :student => student1, :qualifyingentity_tlresult => qe1_tlr1)
    score_qe1_tlr1_st2 = FactoryGirl.create(:score, :grade => 5, :student => student2, :qualifyingentity_tlresult => qe1_tlr1)
    score_qe1_tlr2_st1 = FactoryGirl.create(:score, :grade => 10, :student => student1, :qualifyingentity_tlresult => qe1_tlr2)
    score_qe1_tlr2_st2 = FactoryGirl.create(:score, :grade => 5, :student => student2, :qualifyingentity_tlresult => qe1_tlr2)
    score_qe2_tlr1_st1 = FactoryGirl.create(:score, :grade => 10, :student => student1, :qualifyingentity_tlresult => qe2_tlr1)
    score_qe2_tlr1_st2 = FactoryGirl.create(:score, :grade => 5, :student => student2, :qualifyingentity_tlresult => qe2_tlr1)
    score_qe2_tlr3_st1 = FactoryGirl.create(:score, :grade => 10, :student => student1, :qualifyingentity_tlresult => qe2_tlr3)
    score_qe2_tlr3_st2 = FactoryGirl.create(:score, :grade => 5, :student => student2, :qualifyingentity_tlresult => qe2_tlr3)
    score_qe3_tlr2_st1 = FactoryGirl.create(:score, :grade => 10, :student => student1, :qualifyingentity_tlresult => qe3_tlr2)
    score_qe3_tlr2_st2 = FactoryGirl.create(:score, :grade => 5, :student => student2, :qualifyingentity_tlresult => qe3_tlr2)
    score_qe3_tlr3_st1 = FactoryGirl.create(:score, :grade => 10, :student => student1, :qualifyingentity_tlresult => qe3_tlr3)
    score_qe3_tlr3_st2 = FactoryGirl.create(:score, :grade => 5, :student => student2, :qualifyingentity_tlresult => qe3_tlr3)

    assert_equal (10*0.2+10*0.8)/(0.2+0.8), AverageScore.where(:student_id => student1, :tlresult_id => tlr1.id).first.grade
    assert_equal (5*0.2+5*0.8)/(0.2+0.8), AverageScore.where(:student_id => student2, :tlresult_id => tlr1.id).first.grade
    assert_equal (10*0.5+10*0.5)/(0.5+0.5), AverageScore.where(:student_id => student1, :tlresult_id => tlr2.id).first.grade
    assert_equal (5*0.5+5*0.5)/(0.5+0.5), AverageScore.where(:student_id => student2, :tlresult_id => tlr2.id).first.grade
    assert_equal (10*0.7+10*0.3)/(0.7+0.3), AverageScore.where(:student_id => student1, :tlresult_id => tlr3.id).first.grade
    assert_equal (5*0.7+5*0.3)/(0.7+0.3), AverageScore.where(:student_id => student2, :tlresult_id => tlr3.id).first.grade
  end

end
