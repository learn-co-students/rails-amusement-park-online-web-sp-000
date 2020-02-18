class AttractionsController < ApplicationController
def new
end

  def index
    @user= User.find(session[:user_id])
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

end