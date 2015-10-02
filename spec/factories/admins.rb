FactoryGirl.define do
  factory :admin do
    display_name Faker::Name.name
    email Faker::Internet.email
    password Faker::Internet.password(10)
  end
end
