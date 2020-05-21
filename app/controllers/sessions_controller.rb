class SessionsController < ApplicationController

  def create
    if params[:user][:name]
      @user = User.find_by(name: params[:user][:name])

      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        # Incorrect password
        redirect_to '/signin'
      end
    else
      redirect_to '/'
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end

end
