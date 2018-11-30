class GamesChannel < ApplicationCable::Channel
  def subscribed
    if !!params[:game]
      @game = Game.find_by(id: params[:game])
      byebug
      stream_for @game
    else
      stream_from "games_channel"
    end
  end


  def unsubscribed
  end
end
