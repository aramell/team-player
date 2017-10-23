class SportsController < ApplicationController
  include SportHelper

  def index
  
    @sports = Sport.all
  end
  def new
    @sport = Sport.new
  end

  def create

  end

  private

  def sports_params

  end
  
  # def set_sport
  #   @sport = Sport.find_by(:id => params[:id])

  # end

end
