class UsersController < ApplicationController
  def index
    query = params[:search]

    ### AR/SQL
    cskill = current_user.skill_rating
    filtered_users = User.where.not(id: current_user.id).where(skill_rating: (cskill * 0.7)..(cskill * 1.3))

    # day = Date.parse(query[:start_datetime]).cwday
    # # start_time =

    # filtered_users = skill_filtered.joins(
    #   :availabilities).where(
    #   "availabilities.day = ? AND availabilities.start_time = ? AND availabilities.end_time = ?", day, start_time, end_time
    #   )
    #   # TODO: no, it's a range.
    ###

    @venues = Venue.near([current_user.latitude, current_user.longitude], query[:will_travel_km])

    @results = []
    filtered_users.each do |user|
      venues_near = @venues.select do |venue|
        Geocoder::Calculations.distance_between(
          [user.latitude, user.longitude], [venue.latitude, venue.longitude]
          ) <= user.will_travel_km
      end

      if venues_near.length > 0
        @results << {user: user, venue: venues_near[0]} # can do multiple tho
      end
    end

    # @markers = @users.map do |user|
    #   {
    #     lat: user.latitude,
    #     lng: user.longitude
    #   }
    # end
    # @markers << {lat: current_user.latitude, lng: current_user.longitude}

    @markers = @results.map do |result|
      {
        lat: result[:user].latitude,
        lng: result[:user].longitude
      }
    end

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
