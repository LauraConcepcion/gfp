# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tlresult do
    name { Faker::Lorem.sentence }
    association :matter
  end
end
