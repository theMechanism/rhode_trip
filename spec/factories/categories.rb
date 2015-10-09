FactoryGirl.define do
  factory :category do
    name 'Parent Category'
    parent nil
    is_parent true

    trait :child do
      is_parent false
      name 'Child Category'
    end
  end
end
