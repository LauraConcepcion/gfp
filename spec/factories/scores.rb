# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :score do
    association :student
    association :qualifyingentity_tlresult
    grade { rand*10 }
  end
end

