class LobbyChannel < ApplicationCable::Channel
  def subscribed
      stream_from "lobby_channel"
  end

  def unsubscribed
  end
end
