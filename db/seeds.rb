# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# case Rails.env
# when "development"

  def address_stub
    {
      line_1: Faker::Address.street_address,
      line_2: Faker::Address.secondary_address,
      city: Faker::Address.city,
      zip: Faker::Address.zip
    }
  end

  def tf_rand
    [true, false].sample
  end

  user = User.create(display_name: "Mech UserTester", email: "foo@bar.com", password: "password")
  self_publisher = User.create(display_name: "Mech SelfPub", email: "self@pub.com", password: "password", can_self_publish: true)
  Admin.create(display_name:"Test Admin", email: "author@test.com", password: "password")

  categories = []
  %w(Culture Shopping Outdoor Indoor Amusement).each do |cat| 
    categories << Category.create(name: cat)
  end

  places = []
  people = []


  [ user, self_publisher ].each do |author|
    5.times do
      cat_count = 1 + rand(3)
      cats = categories.sample( cat_count )
      places << Place.create(
        address: address_stub,
        name: Faker::Company.name,
        categories: cats,
        author: author,
        approved: tf_rand
      )
      people << Person.create(
        name: Faker::Name.name, 
        abstract: Faker::Lorem.sentence,
        description: Faker::Lorem.paragraphs( cat_count ),
        occupation: Faker::Name.title,
        approved: tf_rand,
        author: author
      )
    end
  end

  places.each do |place|
    my_rand = rand(3)
    if my_rand > 0
      place.people.push( people.sample( my_rand ) )
    end
  end








# end