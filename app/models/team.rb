class Team < ApplicationRecord
  has_many :users
  has_many :games
  has_many :team_sports
  has_many :sports, through: :team_sports
  

  def sports_attributes=(sports_hash)
    sports_hash.each do |i, sport|
           new_sport = Sport.find_or_create_by(:name => sport[:name])
           
          self.sports.build(:name => new_sport.name)
    end
  end

    def show_users
      @team.users.each do |user|
        user.name
      end

    end
  
end
