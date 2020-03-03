# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


### Users

User.create!(
  email: "bigdave@gmail.com",
  password: "password",
  name: "Dave",
  skill_rating: 1068,
  rep_rating: 7,
  # will_travel_km: 3,
  # will_match_units: 300,
  latitude: 51.436008,
  longitude: -0.213844
  # address: "271 Church Lane, Wimbledon, London SW19 5AF"
)
User.create!(
  email: "jill@gmail.com",
  password: "password",
  name: "Jill Valentine",
  skill_rating: 1154,
  rep_rating: 3,
  latitude: 51.447015,
  longitude: -0.220174
  # address: "Cambium, 15 Victoria Dr, London SW19 6AD"
)
User.create!(
  email: "greg@gmail.com",
  password: "password",
  name: "Greg Fields",
  skill_rating: 982,
  rep_rating: -2,
  latitude: 51.441641,
  longitude: -0.213319
  # address:
)
User.create!(
  email: "daigo@gmail.com",
  password: "password",
  name: "Daigo Umehara",
  skill_rating: 1211,
  rep_rating: 4,
  latitude: 51.439424,
  longitude: -0.201095
  # address: "81 Revelstoke Rd, Wimbledon Park, London SW18 5NL"
)
User.create!(
  email: "sofia@gmail.com",
  password: "password",
  name: "Sofia Alanis",
  skill_rating: 1037,
  rep_rating: 1,
  latitude: 51.421967,
  longitude: -0.217034
  # address: "30 - 34 Ridgway, Wimbledon, London SW19 4QW"
)


# 10.times do
#   User.create!(
#     email: Faker::Internet.email,
#     password: "password",
#     name: Faker::Name.name,
#     skill_rating: rand(0..3000),
#     rep_rating: rand(-10..10),
#     will_travel_km: rand(0..5),
#     will_match_units: rand(300..1000),
#     address: Faker::Address.street_address
#   )
# end


### Availabilities

# User.all.each do |user|
#   rand(1..7).times do |i|
#     avail = Availability.create!(
#       user: user,
#       day: i
#     )
#     hour = rand(15..20)
#     avail.start_time = DateTime.new(2000,1,1, hour,0,0)
#     avail.end_time = (avail.start_time.to_time + 3600*(3)).to_datetime
#     avail.save!
#   end
# end


### Venues

Venue.create!(
  latitude: User.first.latitude,
  longitude: User.first.longitude
)

# 30.times do
#   Venue.create!(
#     address: Faker::Address.street_address
#   )
# end


### Matches
# could seed some completed matches for viewing in a history chart or something

match = Match.create!(
  sender_id: User.first.id,
  receiver_id: User.second.id,
  venue: Venue.first,
  acceptance_deadline_hrs: 6
)
match.start_datetime = match.created_at + 100_000
match.save!

match = Match.create!(
  sender_id: User.fourth.id,
  receiver_id: User.first.id,
  venue: Venue.first,
  acceptance_deadline_hrs: 6
)
match.start_datetime = match.created_at + 200_000
match.save!

match = Match.create!(
  sender_id: User.third.id,
  receiver_id: User.first.id,
  venue: Venue.first,
  acceptance_deadline_hrs: 6
)
match.start_datetime = match.created_at + 300_000
match.save!

# 5.times do
#   sender_id = User.all.order(Arel.sql('RANDOM()')).first.id
#   match = Match.create!(
#     sender_id: sender_id,
#     receiver_id: User.where.not(id: sender_id).order(Arel.sql('RANDOM()')).first.id,
#     venue: Venue.all.order(Arel.sql('RANDOM()')).first,
#     acceptance_deadline_hrs: rand(1..24)
#   )
#   match.start_datetime = match.created_at + rand(100_000..900_000)
#   match.save!
# end
