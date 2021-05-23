class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(:name => params[:name])

    raise params.inspect
    # if User.exists?(name:'Max Charles')
    #   raise params.inspect
    #   session[:user_id] = user.id
    redirect_to "/users/#{@user.id}"
    # else
    #   raise params.inspect
    # end
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end
