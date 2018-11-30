class GameSerializer < ActiveModel::Serializer
  attributes :id, :title, :hasPassword, :unSecurePassword, :active
end
