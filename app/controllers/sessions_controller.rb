class SessionsController < ApplicationController
  # def create
  #   @user = User.find_by(name: params['user']['name'])
  #   if @user.authenticate(params[:password])
  #     session[:user_id] = @user.id
  #     redirect_to user_path(@user)
  #   else
  #     redirect_to "/"
  #   end
  # end

  def create
    user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to user_path(user.id)
  end

  def destroy
    session.delete :user_id
    # redirect_to root_path
    redirect_to '/'
  end

  def new
    @users = User.all
  end
end
