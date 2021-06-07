class UsersController < ApplicationController

  def home
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
     if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    if logged_in? 
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update

  end


  private
    def user_params
      params.require(:user).permit(:name, :password, :tickets, :height, :happiness, :nausea, :height, :admin  )
    end


end
