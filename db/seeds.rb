require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Gossip.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('gossips')
User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
City.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('cities')


10.times do |x|
  c = City.create(name: Faker::Address.city, zip_code: "#{rand(0..9)}#{rand(1000..9000)}")
  puts "City #{c.name} created"
end

20.times do |x|
  u = User.create(
    first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::TvShows::SouthPark.quote, age: rand(18..45), email: Faker::Internet.email, city_id: rand(1..10), password: "test123")
  puts "Utilisateur #{u.first_name} créé !"
end

50.times do |x|
  g = Gossip.create(title: Faker::Book.title, content: Faker::TvShows::HowIMetYourMother.quote, user_id: rand(1..20))
  puts "Gossip #{g.id}"
end
