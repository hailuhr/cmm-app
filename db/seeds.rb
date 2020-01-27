# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'



12.times do |i|
  User.create(
    email: Faker::Internet.email,
    password: "password"
  )
end


10.times do |index|
  bio = ""
  5.times { |i| bio += " #{Faker::Lorem.sentence}" }

  profile = Profile.create(
             first_name: Faker::Name.first_name,
             last_name: Faker::Name.last_name,
             bio: bio,
             user_id: index
           )
end
