FactoryGirl.define do
  factory :person do
    name Faker::Name.name
    abstract Faker::Lorem.sentence
    description Faker::Lorem.paragraphs[0]
    allow_comments true
    approved false
    association :author, factory: :user, display_name: Faker::Name.name, email: Faker::Internet.email
  end
end
