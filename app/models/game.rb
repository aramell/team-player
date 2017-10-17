class Game < ApplicationRecord
  has_many :team_games
  has_many :users, through: :team_games
  has_many :sport_games
  has_many :sports, through: :sport_games
  has_many :game_fields
  has_many :fields, through: :game_fields
  # accepts_nested_attributes_for :fields

  def fields_attributes=(field_hashes)
    raise field_hashes.inspect
  end

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