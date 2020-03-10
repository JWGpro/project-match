# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


### Users

temp = User.new(
  email: "bigdave@gmail.com",
  password: "password",
  name: "Dave",
  bio: "My name is Dave and I like tennis",
  skill_rating: 1068,
  rep_rating: 5,
  will_travel_km: 3,
  # will_match_units: 300,
  latitude: 51.436008,
  longitude: -0.213844
  # address: "271 Church Lane, Wimbledon, London SW19 5AF"
)
temp.avatar.attach(
  io: open('https://res.cloudinary.com/dzx4pveid/image/upload/v1583343878/dave_mwvxdk.jpg'),
  filename: 'dave.jpg')
temp.save!

temp = User.new(
  email: "jill@gmail.com",
  password: "password",
  name: "Jill Valentine",
  bio: "My name is Jill and I like tennis",
  skill_rating: 1154,
  rep_rating: 3,
  will_travel_km: 3,
  # address: "Cambium, 15 Victoria Dr, London SW19 6AD"
  # latitude: 51.447015,
  # longitude: -0.220174

  # Venue 3
  latitude: 51.416732,
  longitude: -0.254581
)
temp.avatar.attach(
  io: open('https://res.cloudinary.com/dzx4pveid/image/upload/v1583343878/jill_vqcedz.jpg'),
  filename: 'jill.jpg')
temp.save!

temp = User.new(
  email: "greg@gmail.com",
  password: "password",
  name: "Greg Fields",
  bio: "My name is Greg and I like tennis",
  skill_rating: 982,
  rep_rating: 2,
  will_travel_km: 3,
  # address:

  # Venue 1
  latitude: 51.441641,
  longitude: -0.213319
)
temp.avatar.attach(
  io: open('https://res.cloudinary.com/dzx4pveid/image/upload/v1583343878/greg_cvxdxv.jpg'),
  filename: 'greg.jpg')
temp.save!

temp = User.new(
  email: "daigo@gmail.com",
  password: "password",
  name: "Daigo Umehara",
  bio: "My name is Daigo and I like tennis",
  skill_rating: 1211,
  rep_rating: 4,
  will_travel_km: 3,
  # address: "81 Revelstoke Rd, Wimbledon Park, London SW18 5NL"
  # latitude: 51.439424,
  # longitude: -0.201095

  # Venue 2
  latitude: 51.431513,
  longitude: -0.175462
)
temp.avatar.attach(
  io: open('https://res.cloudinary.com/dzx4pveid/image/upload/v1583343878/daigo_rlyvrr.jpg'),
  filename: 'daigo.jpg')
temp.save!

temp = User.new(
  email: "sofia@gmail.com",
  password: "password",
  name: "Sofia Alanis",
  bio: "My name is Sofia and I like tennis",
  skill_rating: 1037,
  rep_rating: 1,
  will_travel_km: 3,

  # Venue 3
  # address: "30 - 34 Ridgway, Wimbledon, London SW19 4QW"
  latitude: 51.421967,
  longitude: -0.217034
)
temp.avatar.attach(
  io: open('https://res.cloudinary.com/dzx4pveid/image/upload/v1583343878/sofia_caatde.jpg'),
  filename: 'sofia.jpg')
temp.save!


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

User.all.each do |user|
  7.times do |i|
    # All days, 1600-2000
    av = Availability.new(
      user: user,
      day: i + 1
    )
    av.start_time = DateTime.new(2000,1,1, 16,0,0)
    av.end_time = DateTime.new(2000,1,1, 20,0,0)
    av.save!
  end
end

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
  # 34-16 Gressenhall Rd, Southfields, London
  latitude: 51.451526,
  longitude: -0.207088
)
Venue.create!(
  # London
  latitude: 51.438352,
  longitude: -0.195456
)
Venue.create!(
  # Wimbledon, London SW19 4RF
  latitude: 51.418846,
  longitude: -0.230122
)

# 30.times do
#   Venue.create!(
#     address: Faker::Address.street_address
#   )
# end


### Matches
# could seed some completed matches for viewing in a history chart or something

# Challenge
match = Match.create!(
  sender_id: User.fourth.id,
  receiver_id: User.first.id,
  venue: Venue.first,
  acceptance_deadline_hrs: 6,
  start_datetime: DateTime.new(2020,3,16, 20,0,0)
)

# Upcoming
match = Match.create!(
  sender_id: User.first.id,
  receiver_id: User.second.id,
  venue: Venue.first,
  acceptance_deadline_hrs: 6,
  start_datetime: DateTime.new(2020,3,17, 20,0,0),
  is_accepted: true
)
match = Match.create!(
  sender_id: User.third.id,
  receiver_id: User.first.id,
  venue: Venue.first,
  acceptance_deadline_hrs: 6,
  start_datetime: DateTime.new(2020,3,21, 14,0,0),
  is_accepted: true
)

# Completed
match = Match.create!(
  sender_id: User.first.id,
  receiver_id: User.third.id,
  venue: Venue.first,
  acceptance_deadline_hrs: 6,
  start_datetime: DateTime.new(2020,3,7, 14,0,0),
  is_accepted: true,
  is_complete: true
)

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
