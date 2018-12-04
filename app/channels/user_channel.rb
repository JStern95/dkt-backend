class UserChannel < ApplicationCable::Channel
  def subscribed
    @users = User.all
    stream_from "user_channel"
  end

  # def received(data)
  #   UserChannel.broadcast_to(@users)
  # end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
