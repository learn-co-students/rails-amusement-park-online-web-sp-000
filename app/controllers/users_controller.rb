class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destory]
  
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    @user
    redirect_to user_path(@user)
  end

  def user_params
    params.require(:user).permit(
      :name,
      :password_digest,
      :height,
      :tickets,
      :happiness,
      :nausea,
      :admin
    )
  end

  def show
  end

end
