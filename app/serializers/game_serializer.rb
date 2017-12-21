class GameSerializer < ActiveModel::Serializer
  attributes :id, :game_date, :game_time, :team_id, :user_id, :sport_id, :field_id
  
  belongs_to :team, serializer: TeamGameSerializer
end


