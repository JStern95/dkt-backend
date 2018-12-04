class Game < ApplicationRecord
  validates :title, uniqueness: { case_sensitive: false }
  validates :unSecurePassword, length: { minimum: 1 }, if: :hasPassword?

  def increase
    self.update(:current_players=>self.current_players+1)
  end

  def decrease
    self.update(:current_players=>self.current_players-1)
  end
end
