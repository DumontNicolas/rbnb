# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Cleaning databases"

Review.destroy_all
Reservation.destroy_all
Game.destroy_all
User.destroy_all

puts "Creating database..."

puts "Adding users..."

User.create!(email: "pierre@games.com", password: "123456", first_name: "Pierre", last_name: "Bodin", location: "Paris")
p "Pierre added!"
User.create!(email: "nico@games.com", password: "123456", first_name: "Nicolas", last_name: "Dumont", location: "Paris")
p "Nico added!"
User.create!(email: "clara@games.com", password: "123456", first_name: "Clara", last_name: "Heurteux", location: "Paris")
p "Clara added!"
User.create!(email: "jay@games.com", password: "123456", first_name: "Jay", last_name: "Cormier", location: "Rennes")
p "Jay added!"

p "Everyone's here."

p "Creating games..."

collection = ["Memory", "Card", "Knowledge", "Dices", "Logic", "Board", "Investigation"]

nemesis = Game.create!(name: "Nemesis", description: "A sci-fi cooperation game... with a traitor", user_id: User.all.sample.id, category: collection.sample, price: 15)
azul = Game.create!(name: "Azul", description: "Be the first to build the perfect canvas for the king", user_id: User.all.sample.id, category: collection.sample, price: 10)
the_crew = Game.create!(name: "The Crew", description: "Your team crashed on a planet and you need to leave asap... Unless the planet manages to keep you there", user_id: User.all.sample.id, category: collection.sample, price: 10)
gloomhaven = Game.create!(name: "Gloomhaven", description: "Build a team and explore dungeons in this cooperative campaign-oriented game", user_id: User.all.sample.id, category: collection.sample, price: 20)

30.times do
  game = Game.create!(
    name: Faker::Game.title,
    description: Faker::Lorem.sentence,
    category: collection.sample,
    price: rand(5..30),
    user_id: User.all.sample.id
  )
  game.save!
end

p "Games generation completed"


p "And now, reservations..."
stat = ["pending", "cancelled", "completed"]

10.times do
  reservation = Reservation.create!(
    user: User.all.sample,
    game: Game.all.sample,
    status: stat.sample,
    start_date: Faker::Date.in_date_period(month: 3),
    end_date: Faker::Date.in_date_period(month: 4),
    total: Faker::Number.number(digits: 2)
  )
  reservation.save!
end

Reservation.create!(start_date: "10 Mar 2021", end_date: "12 Mar 2021", user: User.all.sample, game: Game.all.sample, status: "confirmed", total: 45)

p "Reservations have been created"

p "Finally, reviews..."

10.times do
  resa_id = Reservation.all.sample
  review = Review.create!(
    content: Faker::Lorem.sentence,
    reservation_id: resa_id.id,
    user_id: resa_id.user_id,
    rating: rand(1..5),
    role: true
  )
  review.save!
end

p "Reviews created"

p "All done!"
