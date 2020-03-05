class UsersController < ApplicationController
  def index
    query = params[:search]

    ### AR/SQL
    cskill = current_user.skill_rating
    filtered_users = User.where(skill_rating: (cskill * 1.3)..(cskill * 0.7))

    # day = Date.parse(query[:start_datetime]).cwday
    # # start_time =

    # filtered_users = skill_filtered.joins(
    #   :availabilities).where(
    #   "availabilities.day = ? AND availabilities.start_time = ? AND availabilities.end_time = ?", day, start_time, end_time
    #   )
    #   # TODO: no, it's a range.
    ###

    @venues = Venue.near(current_user.latitude, current_user.longitude, query[:will_travel_km])

    @results = []
    @venues.each do |venue|
      users_near = filtered_users.select do |user|
        Geocoder::Calculations.distance_between(
          [user.latitude, user.longitude], [venue.latitude, venue.longitude]
          ) <= user.will_travel_km
      end

      if users_near.length > 0
        users_near.each do |user|
          @results << {user: user, venue: venue}
        end
      end
    end

    raise # does it work??

    # @markers = @users.map do |user|
    #   {
    #     lat: user.latitude,
    #     lng: user.longitude
    #   }
    # end
    # @markers << {lat: current_user.latitude, lng: current_user.longitude}

  end

  def show
    @user = User.find(params[:id])
    @matches = Match.where(sender_id: @user).or(Match.where(receiver_id: @user))
  end

  def edit
  end

  def update
  end
end
