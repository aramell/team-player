class SportsController < ApplicationController
  include SportHelper
  include TeamHelper

  def index
  
    @sports = Sport.all
  end
  def new
    
    @sport = Sport.new
    set_team
  end

  def create
    
    @sport = Sport.create(sports_params)
    if @sport.save
      redirect_to 'root'
    else
      render 'new'
    end

  end

  def destroy
    set_sport
    set_team
    @sport.delete

    redirect_to team_path(team.id)

  end

  private

  def sports_params
    params.require(:sport).permit(:name, :team_id,)
    
  end
  
  # def set_sport
  #   @sport = Sport.find_by(:id => params[:id])

  # end

end
