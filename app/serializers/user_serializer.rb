class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :games_won, :games_lost, :games_played
end
