class UsersController < ApplicationController
  before_action :logged_in?, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    else params.empty?
      redirect_to '/users/new', :alert => "Please fill in all fields"
   end
  end

  def show
    @user = User.find_by(:id => params[:id])
    # if ride 
  end

  private

  def user_params
    params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :password, :admin)
  end
end
