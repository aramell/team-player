class Game < ApplicationRecord
  has_many :team_games
  has_many :users, through: :team_games
end
