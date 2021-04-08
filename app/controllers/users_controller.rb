class UsersController < ApplicationController
  before_action :new_user, only: :new

  def new; end

  def show
    redirect_to root_url unless session[:user_id].present?

    @user = User.find(params[:id])
  end

  def create
    # raise user_params.inspect
    @user = User.create(user_params)

    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'users/new'
    end
  end

  def profile; end

  private

  def new_user
    @user = User.new
  end

  def user_params
    params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :admin, :password)
  end

end
