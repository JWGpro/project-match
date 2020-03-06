class MatchesController < ApplicationController
  def index
    @matches = Match.all
    @users = User.all
    if params[:match]
      @match = Match.find(params[:match])
    else
      @match = Match.all.first
    end
    @message = Message.new
  end

  def show
    @match = Match.find(params[:id])
    @message = Message.new
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      redirect_to root_path
    else
      render "create"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def match_params
    params.require(:match).permit(:acceptance_deadline_hrs, :start_datetime, :receiver_id, :sender_id, :venue_id, :content)
  end
end
