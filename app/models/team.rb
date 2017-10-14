class Team < ApplicationRecord
  has_many :users
  has_many :games

  def team_games
    binding.pry
    current_user.team

  end
end
