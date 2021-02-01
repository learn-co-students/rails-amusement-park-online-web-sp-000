class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if !session[:name].blank?
      redirect_to '/'
    elsif !params[:user][:name].blank?
      session[:user_id] = params[:user][:name]
      redirect_to "/users/#{params[:user][:name]}"
    else
      redirect_to '/login'
    end

  end
  def destroy
    if !session[:user_id].blank?
      session.delete :user_id
    end
    redirect_to '/'
  end

end
