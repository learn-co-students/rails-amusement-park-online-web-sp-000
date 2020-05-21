class UsersController < ApplicationController
  before_action :get_user, only: [:show]
  before_action :require_login
  skip_before_action :require_login, only: [:new, :login, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      # binding.pry
      redirect_to user_path(@user)
    else
      redirect_to users_path
    end
  end


  # TODO: move this to sessions controller??
  def login
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

  def get_user
    @user = User.find(params[:id])
  end

  def require_login
    redirect_to '/' unless session.include? :user_id
  end

end
