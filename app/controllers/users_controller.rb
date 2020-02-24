class UsersController < ApplicationController
  def show
    session[:user_id] == nil ? (redirect_to '/') : nil
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    @user.save ? nil : (return redirect_to controller: 'users', action: 'new')
    session[:user_id] = @user.id
    redirect_to @user
  end

  private

   def user_params
     params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
   end
end
