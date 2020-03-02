# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


### Users

User.create!(
  email: "john@test.com",
  password: "123456",
  name: "John",
  skill_rating: 1500,
  rep_rating: 7,
  will_travel_km: 3,
  will_match_units: 300,
  address: "138 Kingsland Road"
)
User.create!(
  email: "jill@test.com",
  password: "123456",
  name: "Jill",
  skill_rating: 1800,
  rep_rating: 3,
  will_travel_km: 2,
  will_match_units: 1000,
  address: "110 Hoxton St"
)

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: "123456",
    name: Faker::Name.name,
    skill_rating: rand(0..3000),
    rep_rating: rand(-10..10),
    will_travel_km: rand(0..5),
    will_match_units: rand(300..1000),
    address: Faker::Address.street_address
  )
end


### Availabilities

User.all.each do |user|
  rand(1..7).times do |i|
    avail = Availability.create!(
      user: user,
      day: i
    )
    hour = rand(15..20)
    avail.start_time = DateTime.new(2000,1,1, hour,0,0)
    avail.end_time = (avail.start_time.to_time + 3600*(3)).to_datetime
    avail.save!
  end
end


### Venues

30.times do
  Venue.create!(
    address: Faker::Address.street_address
  )
end


### Matches
# could seed some completed matches for viewing in a history chart or something

5.times do
  sender_id = User.all.order(Arel.sql('RANDOM()')).first.id
  match = Match.create!(
    sender_id: sender_id,
    receiver_id: User.where.not(id: sender_id).order(Arel.sql('RANDOM()')).first.id,
    venue: Venue.all.order(Arel.sql('RANDOM()')).first,
    acceptance_deadline_hrs: rand(1..24)
  )
  match.start_datetime = match.created_at + rand(100_000..900_000)
  match.save!
end
