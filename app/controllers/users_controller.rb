class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # raise params.inspect
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to "/users/#{@user.id}"
  end

  def signin
    @users = User.all
  end

  def show
    @user = User.find_by(:id => params[:id])
  end
  #
  # def index
  #   @users = User.all
  # end


  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height)
  end
end
