class Api::V1::GamesController < ApplicationController
  skip_before_action :authorized
  before_action :findGame, only: [:show, :destroy]

  def index
    @games = Game.all
    render json: @games
  end

  def show
    render json: @game
  end

  def create
  game = Game.new(strongParams)
  if game.save
    serialized_data = ActiveModelSerializers::Adapter::Json.new(
      GameSerializer.new(game)
    ).serializable_hash
    ActionCable.server.broadcast 'lobby_channel', serialized_data
    render json: game, head: :ok
  end
end

  def update
    game = Game.find_by(id: params[:id])
    game.update(strongParams)
    if game.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        GameSerializer.new(game)
      ).serializable_hash
      puts 'adsfsadf'
      GameChannel.broadcast_to game, serialized_data
      head :ok
    end
  end

  def destroy
    @game.destroy
  end

  private

  def findGame
    @game = Game.all.find_by(id: params[:id])
  end

  def strongParams
    params.require(:game).permit(:title, :hasPassword, :unSecurePassword, :current_players, :active)
  end

end
