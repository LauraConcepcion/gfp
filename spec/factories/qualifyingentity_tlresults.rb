# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :qualifyingentity_tlresult do
    percentage 100
    association :qualifyingentity
    association :tlresult
  end
end
