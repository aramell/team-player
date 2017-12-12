module TeamHelper
  def team_games
    
      @teamgames = @team.games.all
  end
  def set_team
    @team = Team.find_by(:id => params[:id])
  end
end
