# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quarter do
    name       { Faker::Lorem.word }
    start_date { Time.now }
    end_date   { Time.now + 3.months }
  end
end

