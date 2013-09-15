require 'spec_helper'

describe Score do
  it { should belong_to :qualifyingentity_tlresult }
  it { should belong_to :student }
  it { should validate_numericality_of :grade } unless :new_record?

  it "should be valid" do
    score = FactoryGirl.create(:score)
    score.should be_valid
  end

  it "should calculate average grades with current percentages" do
    pr = FactoryGirl.create(:profile)
    cl = FactoryGirl.create(:classroom, :profile => pr)
    q = FactoryGirl.create(:quarter)
    tlr1 = FactoryGirl.create(:tlresult, :matter => pr.matter)
    tlr2 = FactoryGirl.create(:tlresult, :matter => pr.matter)
    tlr3 = FactoryGirl.create(:tlresult, :matter => pr.matter)
    student1 = FactoryGirl.create(:student)
    student1.classrooms << cl
    student2 = FactoryGirl.create(:student)
    student2.classrooms << cl

    qe1 = FactoryGirl.create(:qualifyingentity, :quarter => q, :profile => pr)
    qe1_tlr1 = FactoryGirl.create(:qualifyingentity_tlresult, :qualifyingentity => qe1, :tlresult => tlr1, :percentage => 20)
    qe1_tlr2 = FactoryGirl.create(:qualifyingentity_tlresult, :qualifyingentity => qe1, :tlresult => tlr2, :percentage => 50)

    # Calculate averages after first qualification.
    score_qe1_tlr1_st1 = FactoryGirl.create(:score, :grade => 10, :student => student1, :qualifyingentity_tlresult => qe1_tlr1)
    score_qe1_tlr1_st2 = FactoryGirl.create(:score, :grade => 5, :student => student2, :qualifyingentity_tlresult => qe1_tlr1)
    score_qe1_tlr2_st1 = FactoryGirl.create(:score, :grade => 10, :student => student1, :qualifyingentity_tlresult => qe1_tlr2)
    score_qe1_tlr2_st2 = FactoryGirl.create(:score, :grade => 5, :student => student2, :qualifyingentity_tlresult => qe1_tlr2)

    assert_equal 10*0.2/0.2, AverageScore.where(:student_id => student1, :tlresult_id => tlr1.id, :quarter_id => q.id).first.grade
    assert_equal 5*0.2/0.2, AverageScore.where(:student_id => student2, :tlresult_id => tlr1.id, :quarter_id => q.id).first.grade
    assert_equal 10*0.5/0.5, AverageScore.where(:student_id => student1, :tlresult_id => tlr2.id, :quarter_id => q.id).first.grade
    assert_equal 5*0.5/0.5, AverageScore.where(:student_id => student2, :tlresult_id => tlr2.id, :quarter_id => q.id).first.grade
    assert !AverageScore.where(:student_id => student1, :tlresult_id => tlr3.id, :quarter_id => q.id).first
    assert !AverageScore.where(:student_id => student2, :tlresult_id => tlr3.id, :quarter_id => q.id).first

    assert_equal 20, QualifyingentityTlresult.joins(:qualifyingentity).where(:tlresult_id => tlr1, 'qualifyingentities.quarter_id' => q.id).sum(:percentage)
    assert_equal 50, QualifyingentityTlresult.joins(:qualifyingentity).where(:tlresult_id => tlr2, 'qualifyingentities.quarter_id' => q.id).sum(:percentage)
    assert_equal 0, QualifyingentityTlresult.joins(:qualifyingentity).where(:tlresult_id => tlr3, 'qualifyingentities.quarter_id' => q.id).sum(:percentage)

    # Calculate averages after second qualification.
    qe2 = FactoryGirl.create(:qualifyingentity, :quarter => q, :profile => pr)
    qe2_tlr1 = FactoryGirl.create(:qualifyingentity_tlresult, :qualifyingentity => qe2, :tlresult => tlr1, :percentage => 70)
    qe2_tlr3 = FactoryGirl.create(:qualifyingentity_tlresult, :qualifyingentity => qe2, :tlresult => tlr3, :percentage => 60)

    score_qe2_tlr1_st1 = FactoryGirl.create(:score, :grade => 10, :student => student1, :qualifyingentity_tlresult => qe2_tlr1)
    score_qe2_tlr1_st2 = FactoryGirl.create(:score, :grade => 5, :student => student2, :qualifyingentity_tlresult => qe2_tlr1)
    score_qe2_tlr3_st1 = FactoryGirl.create(:score, :grade => 10, :student => student1, :qualifyingentity_tlresult => qe2_tlr3)
    score_qe2_tlr3_st2 = FactoryGirl.create(:score, :grade => 5, :student => student2, :qualifyingentity_tlresult => qe2_tlr3)

    assert_equal ((10*0.2+10*0.7)/(0.2+0.7)).round, AverageScore.where(:student_id => student1, :tlresult_id => tlr1.id, :quarter_id => q.id).first.grade
    assert_equal ((5*0.2+5*0.7)/(0.2+0.7)).round, AverageScore.where(:student_id => student2, :tlresult_id => tlr1.id, :quarter_id => q.id).first.grade
    assert_equal 10*0.5/0.5, AverageScore.where(:student_id => student1, :tlresult_id => tlr2.id, :quarter_id => q.id).first.grade
    assert_equal 5*0.5/0.5, AverageScore.where(:student_id => student2, :tlresult_id => tlr2.id, :quarter_id => q.id).first.grade
    assert_equal 10*0.6/0.6, AverageScore.where(:student_id => student1, :tlresult_id => tlr3.id, :quarter_id => q.id).first.grade
    assert_equal 5*0.6/0.6, AverageScore.where(:student_id => student2, :tlresult_id => tlr3.id, :quarter_id => q.id).first.grade

    assert_equal 90, QualifyingentityTlresult.joins(:qualifyingentity).where(:tlresult_id => tlr1, 'qualifyingentities.quarter_id' => q.id).sum(:percentage)
    assert_equal 50, QualifyingentityTlresult.joins(:qualifyingentity).where(:tlresult_id => tlr2, 'qualifyingentities.quarter_id' => q.id).sum(:percentage)
    assert_equal 60, QualifyingentityTlresult.joins(:qualifyingentity).where(:tlresult_id => tlr3, 'qualifyingentities.quarter_id' => q.id).sum(:percentage)

    # Calculate averages after third qualification.
    qe3 = FactoryGirl.create(:qualifyingentity, :quarter => q, :profile => pr)
    qe3_tlr2 = FactoryGirl.create(:qualifyingentity_tlresult, :qualifyingentity => qe3, :tlresult => tlr2, :percentage => 40)
    qe3_tlr3 = FactoryGirl.create(:qualifyingentity_tlresult, :qualifyingentity => qe3, :tlresult => tlr3, :percentage => 20)

    score_qe3_tlr2_st1 = FactoryGirl.create(:score, :grade => 10, :student => student1, :qualifyingentity_tlresult => qe3_tlr2)
    score_qe3_tlr2_st2 = FactoryGirl.create(:score, :grade => 5, :student => student2, :qualifyingentity_tlresult => qe3_tlr2)
    score_qe3_tlr3_st1 = FactoryGirl.create(:score, :grade => 10, :student => student1, :qualifyingentity_tlresult => qe3_tlr3)
    score_qe3_tlr3_st2 = FactoryGirl.create(:score, :grade => 5, :student => student2, :qualifyingentity_tlresult => qe3_tlr3)

    assert_equal ((10*0.2+10*0.7)/(0.2+0.7)).round, AverageScore.where(:student_id => student1, :tlresult_id => tlr1.id, :quarter_id => q.id).first.grade
    assert_equal ((5*0.2+5*0.7)/(0.2+0.7)).round, AverageScore.where(:student_id => student2, :tlresult_id => tlr1.id, :quarter_id => q.id).first.grade
    assert_equal ((10*0.5+10*0.4)/(0.5+0.4)).round, AverageScore.where(:student_id => student1, :tlresult_id => tlr2.id, :quarter_id => q.id).first.grade
    assert_equal ((5*0.5+5*0.4)/(0.5+0.4)).round, AverageScore.where(:student_id => student2, :tlresult_id => tlr2.id, :quarter_id => q.id).first.grade
    assert_equal ((10*0.6+10*0.2)/(0.6+0.2)).round, AverageScore.where(:student_id => student1, :tlresult_id => tlr3.id, :quarter_id => q.id).first.grade
    assert_equal ((5*0.6+5*0.2)/(0.6+0.2)).round, AverageScore.where(:student_id => student2, :tlresult_id => tlr3.id, :quarter_id => q.id).first.grade

    assert_equal 90, QualifyingentityTlresult.joins(:qualifyingentity).where(:tlresult_id => tlr1, 'qualifyingentities.quarter_id' => q.id).sum(:percentage)
    assert_equal 90, QualifyingentityTlresult.joins(:qualifyingentity).where(:tlresult_id => tlr2, 'qualifyingentities.quarter_id' => q.id).sum(:percentage)
    assert_equal 80, QualifyingentityTlresult.joins(:qualifyingentity).where(:tlresult_id => tlr3, 'qualifyingentities.quarter_id' => q.id).sum(:percentage)

    # Calculate averages after final qualification.
    qe4 = FactoryGirl.create(:qualifyingentity, :quarter => q, :profile => pr)
    qe4_tlr1 = FactoryGirl.create(:qualifyingentity_tlresult, :qualifyingentity => qe4, :tlresult => tlr1, :percentage => 10)
    qe4_tlr2 = FactoryGirl.create(:qualifyingentity_tlresult, :qualifyingentity => qe4, :tlresult => tlr2, :percentage => 10)
    qe4_tlr3 = FactoryGirl.create(:qualifyingentity_tlresult, :qualifyingentity => qe4, :tlresult => tlr3, :percentage => 20)

    assert_equal ((10*0.2+10*0.7+10*0.1)/(0.2+0.7+0.1)).round, AverageScore.where(:student_id => student1, :tlresult_id => tlr1.id, :quarter_id => q.id).first.grade
    assert_equal ((5*0.2+5*0.7+5*0.1)/(0.2+0.7+0.1)).round, AverageScore.where(:student_id => student2, :tlresult_id => tlr1.id, :quarter_id => q.id).first.grade
    assert_equal ((10*0.5+10*0.4+10*0.1)/(0.5+0.4+0.1)).round, AverageScore.where(:student_id => student1, :tlresult_id => tlr2.id, :quarter_id => q.id).first.grade
    assert_equal ((5*0.5+5*0.4+5*0.1)/(0.5+0.4+0.1)).round, AverageScore.where(:student_id => student2, :tlresult_id => tlr2.id, :quarter_id => q.id).first.grade
    assert_equal ((10*0.6+10*0.2+10*0.2)/(0.6+0.2+0.2)).round, AverageScore.where(:student_id => student1, :tlresult_id => tlr3.id, :quarter_id => q.id).first.grade
    assert_equal ((5*0.6+5*0.2+5*0.2)/(0.6+0.2+0.2)).round, AverageScore.where(:student_id => student2, :tlresult_id => tlr3.id, :quarter_id => q.id).first.grade

    assert_equal 100, QualifyingentityTlresult.joins(:qualifyingentity).where(:tlresult_id => tlr1, 'qualifyingentities.quarter_id' => q.id).sum(:percentage)
    assert_equal 100, QualifyingentityTlresult.joins(:qualifyingentity).where(:tlresult_id => tlr2, 'qualifyingentities.quarter_id' => q.id).sum(:percentage)
    assert_equal 100, QualifyingentityTlresult.joins(:qualifyingentity).where(:tlresult_id => tlr3, 'qualifyingentities.quarter_id' => q.id).sum(:percentage)
  end

end
