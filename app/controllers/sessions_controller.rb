
class SessionsController < ApplicationController
  skip_before_action :verified_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    if @user = User.find_by(name: params[:user][:name])
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
        session[:user_id]=@user.id
        redirect_to controller: 'users', action: 'welcome'
      end
    else
      render 'new'
    end
  end

  def destroy
    session.delete("user_id")
    redirect_to root_path
  end

end
