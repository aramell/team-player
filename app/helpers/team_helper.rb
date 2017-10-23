module TeamHelper
  def team_games
      @teamgames = @team.games.all
  end
end
