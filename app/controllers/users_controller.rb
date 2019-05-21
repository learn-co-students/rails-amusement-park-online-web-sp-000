class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    unless @user.save
      render 'new'
    end
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    redirect_to root_path unless session.include? :user_id
    @user = User.find(params[:id])
    @message = session[:message]
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end
end
