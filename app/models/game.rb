class Game < ApplicationRecord
  has_many :team_games
  has_many :users, through: :team_games
  def self.team_games(current_user)
    current_user
    current_user.team

  end
end
