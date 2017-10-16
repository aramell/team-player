class Team < ApplicationRecord
  has_many :users
  has_many :games
  has_many :sports

    def show_users
      @team.users.each do |user|
        user.name
      end

    end
  
end
