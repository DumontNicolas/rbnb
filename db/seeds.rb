# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning databases"

Review.destroy_all
Reservation.destroy_all
Game.destroy_all
User.destroy_all


puts "Creating database..."

puts "Adding users..."

pierre = User.create!(email: "pierre@games.com", password: "123456", first_name: "Pierre", last_name: "Bodin", location: "Paris")
p "Pierre added!"
nico = User.create!(email: "nico@games.com", password: "123456", first_name: "Nicolas", last_name: "Dumont", location: "Paris")
p "Nico added!"
clara = User.create!(email: "clara@games.com", password: "123456", first_name: "Clara", last_name: "Heurteux", location: "Paris")
p "Clara added!"
jay = User.create!(email: "jay@games.com", password: "123456", first_name: "Jay", last_name: "Cormier", location: "Rennes")
p "Jay added!"
p "Everyone's here."

p "Creating games..."

nemesis = Game.create!(name: "Nemesis", description: "A sci-fi cooperation game... with a traitor", user_id: User.all.sample.id, category: "Coop", price: 15)
azul = Game.create!(name: "Azul", description: "Be the first to build the perfect canvas for the king", user_id: User.all.sample.id, category: "Economy", price: 10)
the_crew = Game.create!(name: "The Crew", description: "Your team crashed on a planet and you need to leave asap... Unless the planet manages to keep you there", user_id: User.all.sample.id, category: "Coop", price: 10)
gloomhaven = Game.create!(name: "Gloomhaven", description: "Build a team and explore dungeons in this cooperative campaign-oriented game", user_id: User.all.sample.id, category: "Adventure", price: 20)

p "4 games have been added."
p "And now, reservations..."

Reservation.create!(start_date: "10 Mar 2021", end_date: "12 Mar 2021", user: User.all.sample, game: Game.all.sample, status: "confirmed", total: 45)
Reservation.create!(start_date: "15 Mar 2021", end_date: "17 Mar 2021", user: User.all.sample, game: Game.all.sample, status: "pending", total: 30)
p "2 reservations have been created"

p "Finally, reviews..."

gloomhaven.user_id = nico.id
Review.create!(content: "A fine game from a fantastic man!", reservation_id: Reservation.first.id, user_id: gloomhaven.user_id, rating: 5, role: true)

p "Review created"
p "All done!"

