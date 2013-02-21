FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "usuario#{n}@usabi.es" }
    sequence(:password) { |n| "password" }
  end
end
