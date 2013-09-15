# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :average_score do
    grade { Random.rand*10 }
    association :student
    association :quarter
    association :profile
  end
end

