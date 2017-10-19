class TeamsController < ApplicationController


  def index

    @teams = Team.all

  end 
  def new
    @team = Team.new
    @team.sports.build
  end
  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to team_path(@team)
    else
      render 'new'

    end

  end
  def show
    @team = Team.find_by(:id => params[:id])
    @teamgames = @team.games.all
    

  end

  private
  def team_params
    params.require(:team).permit(:name, :positions, :game_id, :sport_ids => [], sports_attributes: [:name])

  end
end
