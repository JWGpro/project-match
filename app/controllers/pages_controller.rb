class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # @user = User.find(params(:id))
    # if current_user
    #   @matches = Match.where(sender_id: current_user.id).or(Match.where(receiver_id: current_user.id))
    # end
  end
end
