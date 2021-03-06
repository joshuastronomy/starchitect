# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

30.times do
  User.create!(
    firstname: Faker::StarWars.specie,
    lastname: Faker::StarWars.vehicle,
    callsign: Faker::StarWars.planet,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    sash_id: rand(1..100)
  )
end
