class Sport < ApplicationRecord
  has_many :sport_games
  has_many :games, through: :sport_games
  has_many :team_sports
  has_many :teams, through: :team_sports

end
