class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        binding.pry
        return head(:forbidden) unless @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    
    def show
        # @user = User.find_by(user_params)
    end
end
