class UsersController < ApplicationController
  before_action :set_user, only: [:show]
# before_action :login_required, only: [:show, :edit, :update, :destroy]
 skip_before_action :verify_authenticity_token, :only => :create
  def index
  end

  def new
    @user = User.new
  end

  def create
     @user = User.create(user_params)
     if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user) 
     else
      redirect_to "/"
     end
  end



  def show
   # @user = User.find(params[:id])
    if current_user == @user
      render :show
    else
      redirect_to '/'
    end
  end



  def destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
  end
end
