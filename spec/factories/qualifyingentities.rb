# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :qualifyingentity do
    name {Faker::Lorem.word }
    association :profile
    association :quarter
  end
end

