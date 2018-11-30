class Game < ApplicationRecord
  validates :title, uniqueness: { case_sensitive: false }
  validates :unSecurePassword, length: { minimum: 1 }, if: :hasPassword?
end
