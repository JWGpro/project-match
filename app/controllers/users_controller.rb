class UsersController < ApplicationController
  def index
    q = params[:search]

    ### AR/SQL
    cskill = current_user.skill_rating
    skill_filtered = User.where.not(id: current_user.id).where(skill_rating: (cskill * 0.7)..(cskill * 1.3))

    date = Date.parse(q[:start_datetime])
    day = date.cwday
    start_time = parse_time(q["start_time(4i)"].to_i, q["start_time(5i)"].to_i)
    end_time = parse_time(q["end_time(4i)"].to_i, q["end_time(5i)"].to_i)

    # Two ranges overlap when:
    #  range_b.begin <= range_a.end && range_a.begin <= range_b.end
    query = <<-SQL
      availabilities.day = ? AND
      availabilities.start_time <= ? AND
      ? <= availabilities.end_time
    SQL

    filtered_users = skill_filtered.joins(:availabilities).where([query,
      day, end_time, start_time])
    ###

    @venues = Venue.near([current_user.latitude, current_user.longitude], q[:will_travel_km])

    @results = []
    filtered_users.each do |user|
      venues_near = @venues.select do |venue|
        Geocoder::Calculations.distance_between(
          [user.latitude, user.longitude], [venue.latitude, venue.longitude]
          ) <= user.will_travel_km
      end

      if venues_near.length > 0
        user_start_time = user.availabilities.where(day: day)[0].start_time
        match_start_time = [start_time, user_start_time].max
        hr = match_start_time.hour
        min = match_start_time.minute
        match_start_datetime = DateTime.new(date.year, date.month, date.day, hr, min, 0)

        @results << {
          user: user,
          venue: venues_near[0], # can give multiple venues if you want
          start_datetime: match_start_datetime
        }
      end
    end

    @markers = @results.map do |result|
      {
        lat: result[:user].latitude,
        lng: result[:user].longitude,
        cl_image_url: result[:user].avatar.key
      }
    end

    @markers << { lat: current_user.latitude, lng: current_user.longitude }

  end

  def show
    @user = User.find(params[:id])
    @matches = Match.where(sender_id: @user).or(Match.where(receiver_id: @user))
  end

  def edit
  end

  def update
  end

  private

  def parse_time(hours, minutes)
    return DateTime.new(2000,1,1, hours,minutes,0)
  end
end
