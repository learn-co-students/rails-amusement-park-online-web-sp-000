class UsersController < ApplicationController
    before_action :require_login, only: [:show]

    def index
    end
    def new
        @user = User.new()
    end
  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to "/users/#{@user.id}"
  end
  def show
    @user = User.find(params[:id])
#   raise @user.inspect
  end

  private
  def user_params
    params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :password, :admin)
  end

  def require_login
    redirect_to '/' unless session.include? :user_id
  end
end
