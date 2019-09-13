class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end
 
  def create
    @user = User.find_by(id: params[:user_name])
    
    return redirect_to '/signin' unless @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect_to @user
  end
  
  def delete
    session.destroy
    redirect_to '/'
  end
  
end