# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "cleaning database"
User.destroy_all
Team.destroy_all

puts "creating users"


Team.create!(name: "Planterose / Unknown", accepted: true)
Team.create!(name: "Unknown / Unknown", accepted: true)


User.create!( email: 'dante@gmail.com', first_name: "Dante", last_name: "Planterose", password: "1234",
  phone: "0634264547", admin: true, team_id: Team.first.id)
User.create!( email: Faker::Internet.email, first_name: Faker::Name.first_name, team_id: Team.first.id,
  last_name: Faker::Name.last_name, password: "1234", phone: "06#{Faker::Number.number(8)}")

2.times do
  User.create!( email: Faker::Internet.email, first_name: Faker::Name.first_name, team_id: Team.second.id,
  last_name: Faker::Name.last_name, password: "1234", phone: "06#{Faker::Number.number(8)}")
end

16.times do
  User.create!( email: Faker::Internet.email, first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name, password: "1234", phone: "06#{Faker::Number.number(8)}")
end


puts "seed done!"
