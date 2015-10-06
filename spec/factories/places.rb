FactoryGirl.define do
  factory :place do
    line_1 Faker::Address.street_address
    line_2 Faker::Address.secondary_address
    city 'Adamsville'
    zip '02801'
    lat Faker::Address.latitude
    long Faker::Address.longitude
    name Faker::Address.city
    association :author, factory: :user, display_name: Faker::Name.name, email: Faker::Internet.email

    initialize_with { new({
        categories: [ create( :category, name: Faker::Name.name )]
      }) 
    }
  end

end
