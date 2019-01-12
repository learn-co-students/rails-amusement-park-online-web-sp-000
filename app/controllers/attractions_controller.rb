class AttractionsController < ApplicationController

  before_action :require_login

  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def show
    @attraction = Attraction.find(params[:id])
  end
  
end
