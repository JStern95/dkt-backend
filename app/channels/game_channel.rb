class GameChannel < ApplicationCable::Channel
  def subscribed
    @game = Game.find_by(id: params[:gameId])
    stream_for @game
    puts @game.title
    @game.increase
    puts @game.current_players
  end

  def received(data)
  GameChannel.broadcast_to(@game, {game: @game, users:
  @game.current_players})
end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    puts @game.title
    @game.decrease
    puts @game.current_players
  end
end
