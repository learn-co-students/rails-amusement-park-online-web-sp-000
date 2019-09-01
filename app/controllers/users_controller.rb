class UsersController < ApplicationController
  before_action :is_logged_in?, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(params[:user].keys))
  
    if @user.save
      log_in @user
      redirect_to @user
    end

  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params(*args)
      params.require(:user).permit(*args)
    end

    def is_logged_in?
      redirect_to root_path unless logged_in?
    end
end
