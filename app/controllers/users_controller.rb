class UsersController < ApplicationController
  before_action :authentication_required, only: [:show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      raise @user.errors.inspect
      redirect_to new_user_path
    end
  end

  def show
    @user = current_user
  end

  def destroy
    session.delete :user_id
    redirect_to new_user_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end
end
