class Game < ApplicationRecord
  has_many :team_games
  has_many :users, through: :team_games
  def self.team_games(current_user)
    current_user
    current_user.team

  end
  def self.next_game(current_user)
    binding.pry
    current_user.team.games.first
  end
end

#custom writer method use raise params.inspect to see how its being sent through params