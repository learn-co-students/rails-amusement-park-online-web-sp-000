class SessionsController < ApplicationController
  def signin
    @users = User.all
  end

  def signout
    destroy  
    redirect_to '/'  
  end

  def create
    if params[:user_name] && params[:user_name] != ""
      if session[:user_name] then
        redirect_to "#{users_path}/#{params[:user_name]}"
      else
        session[:user_id] = params[:user_name] 
        redirect_to "#{users_path}/#{params[:user_name]}"
      end   
    else
      redirect_to '/signin'
    end
  end

  def destroy
    session.delete :user_id
  end

end
