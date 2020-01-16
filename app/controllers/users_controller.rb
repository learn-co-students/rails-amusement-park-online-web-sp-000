# class UsersController < ApplicationController
#   before_action :require_login
#   skip_before_action :require_login, only: [:create, :new]
#   #ORIGINAL: skip_before_action :require_login, only: [:create, :new]
#
#   def create
#     @user = User.create(user_params)
#     session[:user_id] = @user.id
#     redirect_to user_path(@user)
#   end
#
#   def new
#     @user = User.new
#   end
#
#   def show
#     @user = User.find(params[:id])
#   end
#
#   private
#
#   def require_login
#     redirect_to '/' unless session.include? :user_id
#   end
#
#   def user_params
#     params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
#   end
# end


class UsersController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  def create

    user = User.new(user_params)
    if user.valid?
      user.save
      session[:user_id] = user[:id]
      redirect_to "/users/#{user.id}"
    else
      redirect_to "/"
    end
  end

  def show
    @user = User.find(params[:id])
    last_ride = @user.rides.last
    if current_user == @user
      render 'show'
    else
      redirect_to "/"
    end
  end

  def update
    binding.pry
  end

  private

    def user_params
      params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :admin, :password)
    end

end
