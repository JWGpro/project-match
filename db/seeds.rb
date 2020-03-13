require 'open-uri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


### Users (1)

temp = User.new(
  email: "jack@gmail.com",
  password: "password",
  name: "Jack Williams",
  bio: "My name is Jack, and I like tennis.",
  skill_rating: 968,
  rep_rating: 5,
  will_travel_km: 3,
  # will_match_units: 300,
  latitude: 51.436008,
  longitude: -0.213844
  # address: "271 Church Lane, Wimbledon, London SW19 5AF"
)
temp.avatar.attach(
  # io: open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1580887412/pbppcylduzhm2xtk3ird.jpg'),
  # "https://res.cloudinary.com/dzx4pveid/image/upload/v1583934767/jack_asf3zg.jpg"
  # io: open('https://res.cloudinary.com/dzx4pveid/image/upload/v1583343878/dave_mwvxdk.jpg'),
  io: open(File.join(Rails.root, "/app/assets/images/ava/dave.jpg")),
  filename: 'dave.jpg')
temp.save!

### Potential matches (2-6)

temp = User.new(
  email: "jill@gmail.com",
  password: "password",
  name: "Jill Valentine",
  bio: "I'm in it to win! Think you can beat me?",
  skill_rating: 957,
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
  io: open(File.join(Rails.root, "/app/assets/images/ava/jill.jpg")),
  filename: 'jill.jpg')
temp.save!

temp = User.new(
  email: "regan@gmail.com",
  password: "password",
  name: "Regan Wallace",
  bio: "Hurry up and play me!",
  skill_rating: 997,
  rep_rating: 2,
  will_travel_km: 3,

  latitude: 51.435706,
  longitude: -0.199823
)
temp.avatar.attach(
  io: open(File.join(Rails.root, "/app/assets/images/ava/regan.jpg")),
  filename: 'regan.jpg')
temp.save!

temp = User.new(
  email: "greg@gmail.com",
  password: "password",
  name: "Greg Fields",
  bio: "Just a newbie trying to get better with every game.",
  skill_rating: 982,
  rep_rating: 2,
  will_travel_km: 3,
  # address:

  # Venue 1
  latitude: 51.453289,
  longitude: -0.205136
)
temp.avatar.attach(
  io: open(File.join(Rails.root, "/app/assets/images/ava/greg.jpg")),
  filename: 'greg.jpg')
temp.save!

temp = User.new(
  email: "trey@gmail.com",
  password: "password",
  name: "Trey Randall",
  bio: "Nothing beats the thrill of a good challenge!",
  skill_rating: 941,
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
  io: open(File.join(Rails.root, "/app/assets/images/ava/trey.jpg")),
  filename: 'trey.jpg')
temp.save!

temp = User.new(
  email: "sofia@gmail.com",
  password: "password",
  name: "Sofia Alanis",
  bio: "Tennis is fun! Let's play some games!",
  skill_rating: 906,
  rep_rating: 1,
  will_travel_km: 3,

  # Venue 3
  # address: "30 - 34 Ridgway, Wimbledon, London SW19 4QW"
  latitude: 51.421967,
  longitude: -0.217034
)
temp.avatar.attach(
  io: open(File.join(Rails.root, "/app/assets/images/ava/sofia.jpg")),
  filename: 'sofia.jpg')
temp.save!

### Matched users (7-9)

temp = User.new(
  email: "kevin@gmail.com",
  password: "password",
  name: "Kevin Ross",
  skill_rating: rand(900..999)
)
temp.avatar.attach(
  io: open(File.join(Rails.root, "/app/assets/images/ava/kevin.jpg")),
  filename: 'kevin.jpg')
temp.save!

temp = User.new(
  email: "maciej@gmail.com",
  password: "password",
  name: "Pawl Kostek",
  skill_rating: rand(900..999)
)
temp.avatar.attach(
  io: open(File.join(Rails.root, "/app/assets/images/ava/maciej.jpg")),
  filename: 'maciej.jpg')
temp.save!

temp = User.new(
  email: "owen@gmail.com",
  password: "password",
  name: "Owen Wood",
  skill_rating: rand(900..999)
)
temp.avatar.attach(
  io: open(File.join(Rails.root, "/app/assets/images/ava/owen.jpg")),
  filename: 'owen.jpg')
temp.save!

### Around-me (10+)

temp = User.new(
  email: "danny@gmail.com",
  password: "password",
  name: "Danny Hunter",
  skill_rating: rand(900..999)
)
temp.avatar.attach(
  io: open(File.join(Rails.root, "/app/assets/images/ava/danny.jpg")),
  filename: 'danny.jpg')
temp.save!

temp = User.new(
  email: "harper@gmail.com",
  password: "password",
  name: "Harper Kaur",
  skill_rating: rand(900..999)
)
temp.avatar.attach(
  io: open(File.join(Rails.root, "/app/assets/images/ava/harper.jpg")),
  filename: 'harper.jpg')
temp.save!

temp = User.new(
  email: "nicolas@gmail.com",
  password: "password",
  name: "Nicolas Lowe",
  skill_rating: rand(900..999)
)
temp.avatar.attach(
  io: open(File.join(Rails.root, "/app/assets/images/ava/nicolas.jpg")),
  filename: 'nicolas.jpg')
temp.save!

temp = User.new(
  email: "grayson@gmail.com",
  password: "password",
  name: "Grayson Collins",
  skill_rating: rand(900..999)
)
temp.avatar.attach(
  io: open(File.join(Rails.root, "/app/assets/images/ava/grayson.jpg")),
  filename: 'grayson.jpg')
temp.save!

temp = User.new(
  email: "marshall@gmail.com",
  password: "password",
  name: "Marshall Smith",
  skill_rating: rand(900..999)
)
temp.avatar.attach(
  io: open(File.join(Rails.root, "/app/assets/images/ava/marshall.jpg")),
  filename: 'marshall.jpg')
temp.save!

temp = User.new(
  email: "eleanor@gmail.com",
  password: "password",
  name: "Eleanor Hudson",
  skill_rating: rand(900..999)
)
temp.avatar.attach(
  io: open(File.join(Rails.root, "/app/assets/images/ava/eleanor.jpg")),
  filename: 'eleanor.jpg')
temp.save!

temp = User.new(
  email: "ayden@gmail.com",
  password: "password",
  name: "Ayden Byrne",
  skill_rating: rand(900..999)
)
temp.avatar.attach(
  io: open(File.join(Rails.root, "/app/assets/images/ava/ayden.jpg")),
  filename: 'ayden.jpg')
temp.save!


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
# match = Match.create!(
#   sender_id: User.fourth.id,
#   receiver_id: User.first.id,
#   venue: Venue.first,
#   acceptance_deadline_hrs: 6,
#   start_datetime: DateTime.new(2020,3,16, 20,0,0)
# )

# Pending
match = Match.create!(
  sender_id: User.first.id,
  receiver_id: User.find(7).id,
  venue: Venue.first,
  acceptance_deadline_hrs: 6,
  start_datetime: DateTime.new(2020,3,16, 20,0,0)
)

# Upcoming
match = Match.create!(
  sender_id: User.first.id,
  receiver_id: User.find(8).id,
  venue: Venue.first,
  acceptance_deadline_hrs: 6,
  start_datetime: DateTime.new(2020,3,17, 20,0,0),
  is_accepted: true
)
# match = Match.create!(
#   sender_id: User.third.id,
#   receiver_id: User.first.id,
#   venue: Venue.first,
#   acceptance_deadline_hrs: 6,
#   start_datetime: DateTime.new(2020,3,21, 14,0,0),
#   is_accepted: true
# )

# Completed
match = Match.create!(
  sender_id: User.first.id,
  receiver_id: User.find(9).id,
  venue: Venue.first,
  acceptance_deadline_hrs: 6,
  start_datetime: DateTime.new(2020,3,7, 14,0,0),
  is_accepted: true,
  is_complete: true
)
match = Match.create!(
  sender_id: User.first.id,
  receiver_id: User.find(4).id,
  venue: Venue.first,
  acceptance_deadline_hrs: 6,
  start_datetime: DateTime.new(2020,3,2, 20,0,0),
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
