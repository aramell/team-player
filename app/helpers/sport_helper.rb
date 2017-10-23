module SportHelper
  def set_sport
    @sport = Sport.find_by(:id => params[:id])

  end
end
