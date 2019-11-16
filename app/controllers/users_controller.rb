class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to(user_path(@user))
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to(new_user_path)
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def index
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

end
