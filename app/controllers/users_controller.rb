class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:messages] = "Account successfully created."
      redirect_to user_path(@user)
    else
      flash[:errors] = "Account creation failure: #{@user.errors.full_messages.to_sentence}"
      redirect_to signin_path
    end
  end

  def show
    if logged_in?
      @user = User.find(params[:id]) 
    else
      redirect_if_not_logged_in
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end

end