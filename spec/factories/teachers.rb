# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :teacher do
    name     { Faker::Name.first_name }
    surname  { Faker::Name.last_name }
    email    { Faker::Internet.email }
    dni      { Faker::Code.isbn }
    password "123456"
  end
end

