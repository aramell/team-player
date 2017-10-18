class Game < ApplicationRecord
  has_many :team_games
  has_many :users, through: :team_games
  has_many :sport_games
  has_many :sports, through: :sport_games
  has_one :field
  validates :game_time, :game_date, :fields, presence: true
  # accepts_nested_attributes_for :fields

  # def fields_attributes=(field_hashes)
  #   field_hashes.each do |i, field|
  #     new_field = Field.find_or_create_by(name: field[:name], location: field[:location])
  #     self.fields.build(:name => new_field.name, :location => new_field.location)
  #   end
  # end
  # def field_name
  #   fields.first.name
  # end
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