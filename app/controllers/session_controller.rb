class SessionController < ApplicationController
    def new
        @user = User.new
        binding.pry
    end

    def create
        @user = User.find_by(username: params[:username])
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.id    
    end

    
    def show
        # @user = User.find_by(user_params)
    end
end
