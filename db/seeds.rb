# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'admin', first_name: 'admin', last_name: 'admin', password_digest: '1234', phone_number: '12345')

5.times do
  User.create(email: Faker::Internet.email, password_digest: '1234', first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: Faker::PhoneNumber.cell_phone)
end

5.times do
  Trip.create(rider_id: rand(1..5), driver_id: rand(1..5), origin_loc: [12345,54321], destination_loc: [65443,23450])
end

5.times do
  Request.create(user_id: rand(1..5), driver: [true, false].sample, origin_loc: [12345,54321], destination_loc: [43224,10394])
end
