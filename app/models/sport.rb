class Sport < ApplicationRecord
  has_many :sport_games
  has_many :games, through: :sport_games
  has_many :team_sports
  has_many :teams, through: :team_sports
  # validates_uniqueness_of :name
  validates :name, presence: true, length: {minimum: 4, maximum: 20}, uniqueness: true, format: { with: /\A[a-zA-Z0-9\s]+\z/i, message: "Sports Name can only contain letters and numbers." }
  

end
