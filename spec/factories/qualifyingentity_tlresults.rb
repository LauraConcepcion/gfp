# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :qualifyingentity_tlresult do
    association :qualifyingentity
    association :tlresult
  end
end
