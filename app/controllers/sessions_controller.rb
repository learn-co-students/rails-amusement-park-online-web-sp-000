class SessionsController < ApplicationController

    def home
    end

    def new
        @user = User.new
    end

    def create
        user = User.find_by(name: user_params[:name])
        if  user && user.authenticate(user_params[:password])
            session[:user_id] = user.id
            redirect_to user
        else
            redirect_to signin_path
            # Note that when we redirect after validation failure, we lose the instance of @post that has feedback (messages for the user) in its errors attribute.
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end

end
  