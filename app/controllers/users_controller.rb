class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def update
  end

  def destroy
    session.destroy :user_id
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :height, :tickets, :admin)
  end
end
