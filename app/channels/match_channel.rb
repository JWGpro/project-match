class MatchChannel < ApplicationCable::Channel
  def subscribed
    match = Match.find(params[:id])
    puts "************SUBSCRIBED #{match.sender.name}"
    puts match.id
    puts match.id
    puts match.id
    puts match.id
    puts match.id
    puts match.id
    puts match.id
    puts match.id
    puts match.id
    puts match.id
    puts match.id
    puts match.id
    puts match.id
    puts match.id
    puts match.id
    puts match.id
    puts match.id
    puts match.id
    puts match.id
    puts match.id
    puts match.id
    stream_for match
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
