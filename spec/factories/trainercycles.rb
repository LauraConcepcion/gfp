# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trainercycle do
    title { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
  end
end
