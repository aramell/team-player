class TeamsController < ApplicationController
  before_action :set_team, only: [:edit, :show, :update]
  include TeamHelper
  protect_from_forgery with: :null_session


  def index
     @teams = Team.all
      respond_to do |f|
        f.json {render json: @teams}
      end
      # render :layout=> false
  end 
  def new
    @users = User.all
    @team = Team.new
    @team.sports.build
  end
  def create
    @team = current_user.teams.build(team_params)
    if @team.save
      # render 'teams/team', :layout => false
      respond_to do |f|
        f.json {render :json => @team}
      end
    else
      render '/'
    end

  end
  def show
    team_games
    set_team
    respond_to do |f|
      f.json {render json: @team}      
      f.html {render :show}
    end
    #  render :layout=> false
  end

  def edit
    
  end
  def update
    if @team.update_attributes(team_params)
      redirect_to '/'
    else
      render 'edit'
    end
  end
  def destroy
    set_team
    @team.delete
    redirect_to '/'

  end

  private
  def team_params
    params.require(:team).permit(:name, :positions, :game_id, :sport_ids => [],:user_ids => [], :sports_attributes => [:name, :id])
    
  end
  def set_team
    @team = Team.find_by(:id => params[:id])
  end
end
