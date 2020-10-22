class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => :create
 # before_action :login_required, only: [:destroy]

  def new
    @users = User.all
  end

  def create
   # binding.pry
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
     session[:user_id] = @user.id
     redirect_to user_path(@user) 
    else
    
      redirect_to '/signin'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
