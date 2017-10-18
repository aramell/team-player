class Team < ApplicationRecord
  has_many :users
  has_many :games
  has_many :team_sports
  has_many :sports, through: :team_sports
  validates :name, presence: true, length: {minimum: 4, maximum: 20}, uniqueness: true, format: { with: /\A[a-zA-Z]+\z/,
  message: "only allows letters" }
  # validates_presence_of :sports

  # def sports_attributes=(sports_hash)
  #   sports_hash.each do |i, sport|
  #          sport = Sport.find_or_create_by(:name => sport[:name])
  #         self.sports.build(:name => sport)
  #   end
  # end

    def show_users
      @team.users.each do |user|
        user.name
      end

    end
  
end
