class MatchesController < ApplicationController
  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      redirect_to root_path
      # TODO: some kind of success modal?
    else
      render "users"
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
    params.require(:match).permit(:acceptance_deadline_hrs, :start_datetime, :receiver_id, :sender_id)
  end
end
