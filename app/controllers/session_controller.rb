class SessionController < ApplicationController

  def new

  end

  def create

    user = User.find_by(:name => params[:user][:name])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
    end

  end

  def destroy

    if !session[:user_id].nil?
      session[:user_id] = nil
    end

    redirect_to '/'

  end

end
