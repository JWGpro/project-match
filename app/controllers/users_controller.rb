class UsersController < ApplicationController
  def index
    # @users = User.where('skill_rating...').where('availability...').near([@venue.latitude, @venue.longitude], 5)
    @users = User.where.not(id: current_user.id)
    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
    @markers << {lat: current_user.latitude, lng: current_user.longitude}

  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end
end
