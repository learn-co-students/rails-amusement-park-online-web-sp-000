require "pry"

class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = current_user
  end

  def new
  end

  def create
  end

  def update
  end
end
