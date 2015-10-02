FactoryGirl.define do
  factory :user do
    display_name Faker::Name.name
    email Faker::Internet.email
    password Faker::Internet.password(10)
  end
end
