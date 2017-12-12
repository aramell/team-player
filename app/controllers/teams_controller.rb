class TeamsController < ApplicationController
  before_action :set_team, only: [:edit, :show, :update]
  include TeamHelper

  def index
     @teams = Team.all
      respond_to do |f|
        f.html 
        f.json {render json: @teams}
      end
      render 'teams/index', :layout=> false
  end 
  def new
    @users = User.all
    @team = Team.new
    @team.sports.build
  end
  def create
    @team = current_user.teams.build(team_params)
    binding.pry
    if @team.save
      redirect_to team_path(@team)
    else
      render 'new'
    end

  end
  def show
    team_games
    set_team
    
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
  def destroy
    set_team
    @team.delete
    redirect_to teams_path

  end

  private
  def team_params
    params.require(:team).permit(:name, :positions, :game_id, :sport_ids => [],:user_ids => [], :sports_attributes => [:name, :id])

  end
  def set_team
    @team = Team.find_by(:id => params[:id])
  end
end
