# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Deleting Pools"
Pool.destroy_all

puts "Deleting Users"
User.destroy_all


emails = ['p@gmail.com', 'j@gmail.com', 'a@gmail.com', 'f@gmail.com']
passwords = ['p12345', 'j12345', 'a12345', 'f12345']
names = ['pierre', 'jonas', 'alex', 'felix']
addresses = ['bordeaux', 'lille', 'lyon', 'paris']

puts "creating user"

for i in 0..3
    User.create!(
        email: emails[i],
        password: passwords[i],
        name: names[i]
    )
#   puts "user #{user.id} saved"  
end

array_users_id = []
User.all.each do |user|
    array_users_id << user.id
end

puts 'Creating 100 fake pools...'
100.times do
  pool = Pool.new(
    name:    Faker::Company.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    size:  ['small', 'medium', 'large'].sample, 
    price: rand(0..100),
    user_id: array_users_id.sample
  )
  pool.save!
  puts "pool #{pool.id} saved"
end


array_pools_id = []
Pool.all.each do |pool|
    array_pools_id << pool.id
end


puts 'Creating 100 bookings pools...'
5.times do
  booking = Booking.new(
    confirmed: nil,
    start_date: "2022-05-09",
    end_date:  "2022-06-09",
    user_id: array_users_id.sample,
    pool_id: array_pools_id.sample
  )
  booking.save!
  puts "booking #{booking.id} saved"
end