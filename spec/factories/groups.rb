# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    name       { Faker::Name.first_name }
    group_code { Faker::Code.isbn }
  end
end

