class SessionsController < ApplicationController
  def new
    @user_options = User.all.map{ |u| [ u.name, u.id ] }

  end

  def create
  
    @user = User.find_by(id: params[:user_name])
 
    @user = @user.try(:authenticate, params[:password])
    return redirect_to(controller: 'sessions', action: 'new') unless @user
    session[:user_id] = @user.id
    redirect_to @user
  end

  def destroy
    session.delete :user_id
    redirect_to controller: 'attractions', action: 'welcome'
  end

  def show
  end
end
