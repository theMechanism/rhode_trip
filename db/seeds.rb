# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
case Rails.env
when "development"
  user = User.create(username: "Mech UserTester", email: "foo@bar.com")
  ad = Admin.create(username:"Mech TestAdmin", email: "test@test.com")

  %w(Culture Shopping Outdoor Indoor Amusement).each do |cat| 
    Category.create(name: cat)
  end
end