class GameSerializer < ActiveModel::Serializer
  attributes :id, :title, :hasPassword, :unSecurePassword, :active, :current_players
end
