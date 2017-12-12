class SportsController < ApplicationController
  include SportHelper
  include TeamHelper

  def index
  
    @sports = Sport.all
    respond_to do |f|
      f.html 
      f.json {render json: @sports}
    end
     
    render 'sports/index', :layout=> false
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
    binding.pry
    if @sport.delete

    redirect_to teams_path
    else
      redirect_to team
    end

  end

  private

  def sports_params
    params.require(:sport).permit(:name, :team_id,)
    
  end
  
  # def set_sport
  #   @sport = Sport.find_by(:id => params[:id])

  # end

end
