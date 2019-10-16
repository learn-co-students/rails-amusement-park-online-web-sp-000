class AttractionsController < ApplicationController
  def index
    @attractions=Attraction.all
  end

  def show
    @attraction=Attraction.find(params[:id])
    @ride=@attraction.rides.find_by(:user_id=>current_user)
  end
end
