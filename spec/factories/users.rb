FactoryGirl.define do
  factory :user do
    display_name Faker::Name.name
    email Faker::Internet.email
    password Faker::Internet.password(10)

    trait :author do
      role 'Author'
      email Faker::Internet.email
      display_name Faker::Name.name
    end

    trait :publisher do
      role 'Publisher'
      email Faker::Internet.email
      display_name Faker::Name.name
    end

    trait :admin do
      role 'Admin'
      email Faker::Internet.email
      display_name Faker::Name.name
    end
  end
end
