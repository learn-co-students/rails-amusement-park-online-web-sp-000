class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @user = User.find_by(id: session[:user_id])
    @attraction = Attraction.find_by(id: params[:id])
  end
end
