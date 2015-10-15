# case Rails.env
# when "development"
  

  ############################
  # on fresh DB instance - run rake seed:categories + rake seed:places
  # to load in real categories and places
  ############################

  def tf_rand
    [true, false].sample
  end

  user = User.create(display_name: "Mech UserTester", email: "foo@bar.com", password: "password")
  self_publisher = User.create(display_name: "Mech SelfPub", email: "self@pub.com", password: "password", role: 'Publisher')
  admin = User.create(display_name: "MechAdmin", email: "admin@admin.com", password: "password", role: 'Admin')

  categories = Category.all
  places = Place.all
  people = []


  [ user, self_publisher ].each do |author|
    5.times do
      rand_count = 1 + rand(3)

      people << Person.create(
        name: Faker::Name.name, 
        abstract: Faker::Lorem.sentence,
        description: Faker::Lorem.paragraphs( rand_count ).join,
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