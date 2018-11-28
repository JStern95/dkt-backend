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
    @game = Game.create(strongParams)
    render json: @game, status: :created
  end

  def destroy
    @game.destroy
  end

  private

  def findGame
    @game = Game.all.find_by(id: params[:id])
  end

  def strongParams
    params.require(:game).permit(:name)
  end

end
