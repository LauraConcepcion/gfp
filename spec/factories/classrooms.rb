# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :classroom do
    name { Faker::Name.first_name }
    association :profile
  end
end
