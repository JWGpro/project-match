class MessagesController < ApplicationController
  def create
    @match = Match.find(params[:match_id])
    @message = Message.new(message_params)
    @message.match = @match
    @message.user = current_user
    if @message.save
      MatchChannel.broadcast_to(
        @match,
        render_to_string(partial: "message",locals: { message: @message })
      )
      # redirect_to matches_path(current_user, match: @match.id)
    else
      render "matches/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
