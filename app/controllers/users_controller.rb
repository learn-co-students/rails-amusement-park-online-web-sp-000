class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      return redirect_to new_user_path
    end
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    if logged_in?
      @user = current_user
      @ride = @user.rides.build
      @ride.attraction = Attraction.find_by_id(params[:attraction_id])
      flash[:message] = @ride.take_ride
      @ride.user.save
      redirect_to user_path(@ride.user)
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)

  end
end
