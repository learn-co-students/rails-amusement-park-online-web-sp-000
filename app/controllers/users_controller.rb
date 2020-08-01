class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.admin = admin_status

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect root_path
    end
  end

  def show
    @user = User.find_by(id: session[:user_id])

    if !@user
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets)
  end

  def admin_status
    if params[:user][:admin] == "1"
      true
    else
      false
    end
  end
end
