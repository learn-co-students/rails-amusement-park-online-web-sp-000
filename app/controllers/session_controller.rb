class SessionController < ApplicationController
    def new
        @user = User.new
    end

    def create
        if @user = User.find_by(name: params[:user][:name])
        # if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'signin'
        end
    end

    def destroy
        # session.delete(:user_id)
        reset_session
        redirect_to '/'
    end
end