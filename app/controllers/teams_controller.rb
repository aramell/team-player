class TeamsController < ApplicationController
  before_action :set_team, only: [:edit, :show, :update] 

  def index

    @teams = Team.all

  end 
  def new
    @team = Team.new
    @team.sports.build
  end
  def create
    binding.pry
    @team = current_user.teams.build(team_params)
    binding.pry
    if @team.save
      redirect_to team_path(@team)
    else
      render 'new'

    end

  end
  def show
    @teamgames = @team.games.all
    

  end
  def edit
    
  end
  def update
    if @team.update_attributes(team_params)
      redirect_to team_path(@team)
    else
      render 'edit'
    end
  end

  private
  def team_params
    params.require(:team).permit(:name, :positions, :game_id, :sport_ids => [])

  end
  def set_team
    @team = Team.find_by(:id => params[:id])
    
  end
end
