class UsersController < ApplicationController
skip_before_action :authorized_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find_by(:id => params[:id])
  end

  # def edit
  # end
  #
  # def update
  #   if params[:attraction_id]
  #   @user = User.find_by(id: params[:id])
  #
  #   attraction = Attraction.find_by(id: params[:attraction_id])
  #
  #   ride = Ride.create(user_id: @user.id, attraction_id: attraction.id)
  #
  #   flash[:message] = ride.take_ride
  #
  #   redirect_to @user
  #   end
# end


  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height, :admin)
  end
end
