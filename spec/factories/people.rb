FactoryGirl.define do
  factory :person do
    name "MyString"
    abstract "MyText"
    description "MyText"
    allow_comments false
    approved false
    author nil
  end

end
