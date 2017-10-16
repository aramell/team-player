class Sport < ApplicationRecord
  has_many :sport_games
  has_many :games, through: :sport_games

end
