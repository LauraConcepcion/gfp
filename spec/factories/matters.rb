# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :matter do
    name { Faker::Lorem.word }
    association :trainercycle
  end
end
