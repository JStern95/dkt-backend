class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized#, only: %i[:create]


  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      ActionCable.server.broadcast "user_channel", User.all.map {|user| UserSerializer.new(user)}
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def update
    @user = User.find_by(username: params[:username])
    @user.update(user_params)
    # serialized_data = ActiveModelSerializers::Adapter::Json.new(
    #   {users: User.all.map {|user| UserSerializer.new(user)}}
    # ).serializable_hash
    ActionCable.server.broadcast "user_channel", User.all.map {|user| UserSerializer.new(user)}
    render json: @user, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :games_won, :games_lost, :games_played)
  end
end
