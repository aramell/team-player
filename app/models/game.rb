class Game < ApplicationRecord
  has_many :team_games
  has_many :users, through: :team_games
  has_many :sport_games
  belongs_to :sport
  belongs_to :field
  validates :game_time, :game_date, presence: true

  # def fields_attributes=(field_hashes)
  #   field_hashes.each do |i, field|
  #     new_field = Field.find_or_create_by(name: field[:name], location: field[:location])
  #     self.fields.build(:name => new_field.name, :location => new_field.location)
  #   end
  # end
  # def field_name
  #   fields.first.name
  # end
  
  def self.team_games(current_user)
    current_user
    current_user.team
  end
  def self.my_games
    binding.pry
    @teams = current_user.teams
    @games = @teams.games.each do |game|
    
    end
    binding.pry
  end
  def self.game_today
    binding.pry
    @game_today = Game.where('start BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day).all
    
  end
end

#custom writer method use raise params.inspect to see how its being sent through params