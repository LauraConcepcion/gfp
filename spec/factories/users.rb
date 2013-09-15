FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "usuario#{n}@usabi.es" }
    password "password"
    password_confirmation "password"
  end
end
