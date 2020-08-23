class UsersController < ApplicationController
  include ApplicationHelper
  before_action :require_login
  skip_before_action :require_login, only:[:index, :new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(session[:user_id])
    # @alert = session[:msg]
    # binding.pry
    # # session[:msg] = []
  end

  def go_on_ride
    attraction = Attraction.find_by(id: params[:format])
    user = current_user
    ride = Ride.create(user_id: user.id, attraction_id: attraction.id)
    # session[:msg] = ride.ride
    msg = ride.ride
    redirect_to user_path(user), alert: msg
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height, :admin)
  end
end
