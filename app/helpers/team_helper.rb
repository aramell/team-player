module TeamHelper
  def team_games
    binding.pry
      @teamgames = @team.games.all
  end
  def set_team
    @team = Team.find_by(:id => params[:id])
  end
end
