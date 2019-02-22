class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    if params[:ride_taken]
      @ride_taken = params[:ride_taken]
    else
      @ride_taken = ""
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user), notice: "Welcome to the theme park!"
      else
        redirect_to 'users/new'
      end
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :tickets, :happiness, :nausea, :admin)
  end

  def set_user
    @user = User.find_by(id: session[:user_id])
    redirect_to '/' if @user.nil?
  end

end
