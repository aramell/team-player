class Game < ApplicationRecord
  has_many :team_games
  has_many :users, through: :team_games
  has_many :sport_games
  belongs_to :sport
  belongs_to :field
  validates :game_time, :game_date, presence: true
  scope :today_games, -> {where(:game_date => Time.zone.now.beginning_of_day)}

  
  
  def self.team_games(current_user)
    current_user
    current_user.team
  end
  
  
end

#custom writer method use raise params.inspect to see how its being sent through params