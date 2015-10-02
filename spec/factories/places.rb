dumb_json = {
  line_1: 'line_1'
}.to_json

FactoryGirl.define do
  factory :place do
    address dumb_json
    lat Faker::Address.latitude
    long Faker::Address.longitude
    name Faker::Address.city
    association :author, factory: :admin, display_name: Faker::Name.name, email: Faker::Internet.email

    initialize_with { new({
        categories: [ create( :category, name: Faker::Name.name )]
      }) 
    }
  end

end
