class Game < ApplicationRecord
  has_many :team_games
  has_many :users, through: :team_games
  has_many :sport_games
  has_many :sports, through: :sport_games
  has_many :game_fields
  has_many :fields, through: :game_fields
  # accepts_nested_attributes_for :fields

  def fields_attributes=(field_hashes)
    field_hashes.values.each do |field|
      new_field = Field.find_or_create_by(field)
      fields << new_field
    end
  end
  def sports_attributes=(sport_hashes)
    binding.pry
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