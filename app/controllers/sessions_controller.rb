class SessionsController < ApplicationController
    before_action :logged_in?, except: [:new, :create]
    def new
        
    end
    def create
        @user = User.find_by(name: params[:user][:name], password: params[:user][:password])
        if !@user.nil?
          session[:user_id] = @user.id
          redirect_to @user
        else
          render :new
        end
    end
    def destroy
        session.delete :name
        redirect_to '/'
    end
end