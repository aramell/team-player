class Team < ApplicationRecord
  has_many :users
  has_many :games

    def show_users
      @team.users.each do |user|
        user.name
      end

    end
  
end
