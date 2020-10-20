class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index]

    def new
        @user = User.new
    end

    def index
    end

    def create
        @user = User.new(user_params)
        if !@user.valid?
            redirect_to '/login'
        else
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        end
    end

    def show
        binding.pry
        @user = User.find(params[:id])
    end


    private
    def user_params
        params.require(:user).permit(
            :name,
            :password,
            :nausea,
            :happiness,
            :height,
            :tickets,
            :admin
        )
    end

    def require_login
        binding.pry
        redirect_to '/' unless session.include? :user_id
    end
end
