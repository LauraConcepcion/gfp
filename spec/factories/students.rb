# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :student do
    firstsurname  { Faker::Name.last_name }
    secondsurname	{ Faker::Name.last_name }
    name          { Faker::Name.first_name }
    dni           { Faker::Code.isbn }
    mail          { Faker::Internet.email }
  end
end
