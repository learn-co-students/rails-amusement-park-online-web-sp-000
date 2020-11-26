class SessionsController < ApplicationController
# before_action :require_login
# skip_before_action :require_login, only: [:new]

def new
    @users = User.all
    @user = User.new
end

def create
    @user = User.find(params[:user][:name])
    if @user.authenticate(params[:password])
        session[:user_id] = @user.id
    redirect_to user_path(@user)
    else
    redirect_to '/'
    end
    
end

def destroy
    session[:user_id] = nil
    redirect_to '/'
end

private

# def require_login
#     return head(:forbidden) unless session.include? :user_id
# end


end