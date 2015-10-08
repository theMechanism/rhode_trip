FactoryGirl.define do
  factory :category do
    name "Parent Category"
    parent nil
    is_parent true
  end
end
