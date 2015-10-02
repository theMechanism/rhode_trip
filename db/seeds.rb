# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# case Rails.env
# when "development"
  user = User.create(display_name: "Mech UserTester", email: "foo@bar.com", password: "password")
  self_publisher = User.create(display_name: "Mech SelfPub", email: "self@pub.com", password: "password", can_self_publish: true)
  author_admin = Admin.create(display_name:"Mech AuthorAdmin", email: "author@test.com", password: "password")

  %w(Culture Shopping Outdoor Indoor Amusement).each do |cat| 
    Category.create(name: cat)
  end
# end